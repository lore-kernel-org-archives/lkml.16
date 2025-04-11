Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A53A28F936
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360774; cv=none; b=lDSoAZ1Srj82VJTIlZzI996aXusOV4h5tWWVLyO4INFsOCzpIcivkSzvXQMdfL+SXK5hgTovf1Vx48rkzsjW/0WYHYSUzNrmrXe5zeaeBXTrp+4cH9Swz0ozpcfLpADBKl5tD578qsDagilYFeeEWk+ufshjAzCliUPPGjAQGdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360774; c=relaxed/simple;
	bh=Cfxi6fEI2IFX41L3JE13Cy7FJb0PJLrt+bmOBfIv/gY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AE4DgzNWTpzOIW36LQ3Mxgq6hCFPw0dzNKxSSZz2QZCfsiQ51xitzGjpVn7x0xae+Tr+bVyESRZOe1Pwm718rIB+3k3u6RhlE9fOdZDEUtzJZMD51zwI5RC5s7hul8ReCGc1JTpMMw/ZQmodgqp8VlCo8yq4+Md5YAUhMmU4G1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 53B8dGr5046393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 11 Apr 2025 16:39:16 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 16:39:16 +0800
Date: Fri, 11 Apr 2025 16:39:11 +0800
From: CL Wang <cl634@andestech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <tim609@andestech.com>,
        <ycliang@andestech.com>, <cl634@andestect.com>
Subject: Re: [PATCH V5 1/3] rtc: atcrtc100: Add ATCRTC100 RTC driver
Message-ID: <Z_jVLzgZjnF1thbq@swlinux02>
References: <20250110092702.1146356-1-cl634@andestech.com>
 <20250110092702.1146356-2-cl634@andestech.com>
 <20250331221541333bf9cf@mail.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250331221541333bf9cf@mail.local>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 53B8dGr5046393

Hi Alexandre,

Thank you very much for your feedback on the patch, and sorry for the delayed response.
Below are my replies to your comments and questions. I will prepare and send the next
version of the patch as soon as possible.

> +#define RTC_MINUTE(x)        ((x >> MIN_OFF) & MIN_MSK)      /* RTC min */
> +#define RTC_HOUR(x)  ((x >> HOUR_OFF) & HOUR_MSK)    /* RTC hour */
> +#define RTC_DAYS(x)  ((x >> DAY_OFF) & DAY_MSK)      /* RTC day */

FIELD_PREP can probably replace those.
=> That's a good suggestion. I will update this to use bitfield-related macros instead.


> +struct atcrtc_dev {
> +     struct rtc_device       *rtc_dev;
> +     struct regmap           *regmap;
> +     struct delayed_work     rtc_work;
> +     struct mutex            lock;

This mutex is not necessary, simply use rtc_lock() in you interrupt handler, the rtc core is already locking before calling the rtc_ops.
=> You're absolutely right. I will remove the mutex and clean up this
   part accordingly.

> +             usleep_range(ATCRTC_TIMEOUT_USLEEP_MIN,
> +                          ATCRTC_TIMEOUT_USLEEP_MAX);
> +     }
> +     dev_err(&rtc->rtc_dev->dev, "Device is busy too long\n");

Is this error message useful, what would be the user action after seeing this?
==> This message indicates that the RTC hardware might be stuck in a busy state.
    If this occurs, it suggests a potential hardware issue. During development, it
    can serve as a hint to review the RTC module's design. In production, a system
    reset might be required to recover. Based on that, I would prefer to keep this
    error message for diagnostic purposes.


> +static time64_t atcrtc_read_rtc_time(struct atcrtc_dev *rtc)

Does this have to be in a separate function?
=> Not necessarily. It can be merged into atcrtc_read_time(). I will
   make this adjustment.


> +     rtc_time64_to_tm(time, tm);
> +     if (rtc_valid_tm(tm) < 0) {

This is not necessary, the core always checks whether the tm is valid.
=> Thanks for pointing that out. I’ll remove this check.


> +     rem -= hour * 3600;
> +     min = rem / 60;
> +     sec = rem - min * 60;

You already had the broken down hour, min and sec, it is not necessary to compute that again here, just fold this function in atcrtc_set_time
=> You're right, I will simplify this part by integrating it directly
   into atcrtc_set_time().

> +     ret = atcrtc_check_write_done(rtc);
> +     if (ret)
> +             return ret;
> +     regmap_update_bits(rtc->regmap, RTC_CR, RTC_EN, RTC_EN);

This is losing some important information, the RTC must only be enabled once the time has been correctly set, then you can check RTC_EN in
atcrtc_read_time() to know whether the time is actually valid or not.
=> I will move the RTC_EN setting to atcrtc_set_time() and add a check for
   this bit in atcrtc_read_time() to ensure the time from RTC is valid.

> +     if (IS_ERR(atcrtc_dev->rtc_dev)) {
> +             dev_err(&pdev->dev,
> +                     "Failed to allocate RTC device: %ld\n",
> +                     PTR_ERR(atcrtc_dev->rtc_dev));
> +             return PTR_ERR(atcrtc_dev->rtc_dev);
> +     }
> +
> +     ret = atcrtc_alarm_enable(&pdev->dev, true);

Can't atcrtc_alarm_enable be part of atcrtc_hw_init so you don't have to wait twice?
=> After reviewing your comment, I agree. I think atcrtc_alarm_enable()
   should instead be integrated into atcrtc_set_alarm() and removed from
   here.

Thanks again for your detailed feedback. I'll revise the patch accordingly
and send out the updated version soon.

Best regards,
CL
