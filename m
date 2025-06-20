Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B731630E848
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750453289; cv=none; b=FznhKEs5tiNM+nivtrxnh6Yqep3qZkiFqySk8FOLUhKO5SnSUNe6yPyHUAc+f1G0I0BXlL/mhJTGJ4Ek497pY+Lnodb7S0iFSpDqlbGDywT9SQ5dmKgmkBglvxmjFbxDz+YEHUsimEN5j/DNTiLsuEYnJ9onr19/HYA1kLS46yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750453289; c=relaxed/simple;
	bh=tHyk3t0CuXdNhj2Iwn8cdQiUUp8AeSUXGMFoEDsSqHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdVJu+9IuNPBWYTBMvBGeAiCnaMizAyhPjy1OZPw5mW31voCmxTMsLYs9k64AEso+bWx711ghPDK+sRQBzf7bg9A0tMBTJaCTf5RDgAZN7cSW4EHcjhLNcTNmn0rArgAReqxE+0eXNXvgZseufSW50Z6yKkHzXFMxLUz91pGZb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YmzK5i6s; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YmzK5i6s"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4067b7d7e52so539012b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750453287; x=1751058087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bPfdrJsc6SyDgZhcqK06/DS6CQf5yfjgO3ypGfImvDI=;
        b=YmzK5i6sdPBi6dpr0Fr9y3DXCHKwl/zmKaqukVCGT/eEYzP+bvtTdqh2GtB9N4O0Vg
         zR0u5kEc599Jgi+NxEE7QM4MT9bZDZqObdQ4P7rXWdhUMKuv5H9uiV2epAFgaMxgoc8Q
         aYFUcwBys1W0waL7Y+7dXpLyUu84dd3RXwflXrJSen2D8QBAKp7Ri3db5N4xEyU09pmp
         wf8gAm15RpV5f/hJ7WZxrgln2o5tP6dYbxrBqtDN9r1PZ9Nowxf1waikLJChYYtEXr77
         ge37kWrzofm+B+F2sTayvtS8n5LTgmNGVnbcjs7ArFN5mFmOU1NG0pHMCV0qFDbKANkM
         IBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750453287; x=1751058087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPfdrJsc6SyDgZhcqK06/DS6CQf5yfjgO3ypGfImvDI=;
        b=CpLQWT51WrqAR5OZQwZj4iJXN8KxScG+u2gKmPdFg+P7BETIWRRkfW+T11al5GDP4c
         8hFeNdnzoAlqMHPwC9mFtr9oK8MsiZ0w8NQYC9pv2xl8a60bqorU5v5hrpidsP2YPRQN
         kdFtWNiRqtSiI8HXQYzyWnqh5pKmYSFd6LtAm9fzQ7n5gFjtT6GaxnhkUOVbnYtyyLzH
         iWXcQx1l94NIZ5cw+3vzMVTNHrhhEB6qfkWL7aou7t18XrngXMdPgmPlpHDlAYPfoOwz
         zQpKbMSDrkR7hpGbl7yel7c8pWSm8FYEt2Zx2hJtMQVCktlCCTDDXzlENnkzK2c5KSZl
         p+Kg==
X-Gm-Message-State: AOJu0YwQpg8h1cI6PtCEioHeKA8f0veGDYJKmHx8G1jE8C6udbDfe/Cp
	v9b6vdXZrNLliGHl0NYVEBLFgm1gc3PofWRSowBbiWdzxDdnlmcnsy56BZqhCm+FrtE=
X-Gm-Gg: ASbGncs2q0wh41OX5TUbZQZxdHjd/BfqDtipFeVqolMBdNvQz4/zQkgRSdcuY+cK3fb
	dWL+/D9VB//u06WWvwP6TyGJ+FpIJqB3a/qfIHjwAoJqup+hbXbucr7kIZFlR5TYsj4iEyZ6MAs
	E8okNe9CDt6ZXIzb2sxBcjmqtLop56JsA/B16/tSWWT2mrO5+Ewm+b7SF0FaY02awjLtBNNsZyW
	bIKZErAMYOu0S4RLuEZsABolNFtWyqaOgXQGSh2xTXWscoFKY35dshYyaUOtckm9kw75/DLWdmP
	4D5s/ypCwJGqfMZr/OZDPG2WBk1sIyKQKprQWrF9KYwG0DjeisT8cbZUYVlf3N1Mt9SONg==
X-Google-Smtp-Source: AGHT+IHKvI+mlOijqo3udRWnDlycAVvVSoeM8zvft6XIXbrw2Mbg1ujBAm0ngTbxYas49+aqilccLQ==
X-Received: by 2002:a05:6871:7393:b0:2d9:3868:b324 with SMTP id 586e51a60fabf-2eeee4e0080mr2955071fac.23.1750453286668;
        Fri, 20 Jun 2025 14:01:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:35a7:a70f:9610:a99b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eead967b86sm543589fac.50.2025.06.20.14.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:01:25 -0700 (PDT)
Date: Sat, 21 Jun 2025 00:01:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 3/7] firmware: arm_scmi: Add Telemetry protocol
 support
Message-ID: <b33a0c18-2850-453f-8ee6-5574330b3670@suswa.mountain>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-4-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620192813.2463367-4-cristian.marussi@arm.com>

On Fri, Jun 20, 2025 at 08:28:09PM +0100, Cristian Marussi wrote:
> +	/* Build compsing DES string */
> +	for (int i = 0; i < ti->info.num_groups; i++) {
> +		struct scmi_telemetry_group *grp = &ti->info.des_groups[i];
> +		char *buf = grp->des_str;
> +		size_t bufsize = grp->des_str_sz;
> +
> +		for (int j = 0; j < grp->num_de; j++) {
> +			char term = j != (grp->num_de - 1) ? ' ' : '\0';
> +			int len;
> +
> +			len = snprintf(buf, bufsize, "0x%04X%c",
> +				       ti->info.des[grp->des[j]]->id, term);

Please use scnprintf() btw.  Otherwise if there is an overflow the
next iteration will complain that bufsize is negative.

> +
> +			buf += len;
> +			bufsize -= len;
> +		}
> +	}
> +
> +	return 0;
> +}

regards,
dan carpenter

