Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F1629A9E4
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023414; cv=none; b=tq2vLgx+RlGNjL3/jT2Z+tZBuLp9hxUo2lUBwtKVIQN0sLlpg+ovk9wA8rqv7sT41hRoLPfYgcmAYL/zFQ6gFxx054zsBncMZfzJ+CUI6zOS26HD454+oN/3Ij5hu0oU8lZhpOI1ANjaUDrR0lY+tdZqp0EzMhHenRPdI7tbmOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023414; c=relaxed/simple;
	bh=avxtm9tRxoS2zNKPMFem+AIRUXJax9YQN0ZSTamMQDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgGhowFoPKrVMw0D4lal1T4aJtsdBi1FqPT1VCgaLsuakzWaVSMKLfzprYoidJFdL7d8y7i61aJVD7wZt7CvzUvjn+2m+/N2HXK6MDtSzQsl8pGtKf0qiOm4XN5Tgj+uspTdF7kzXD+rnqhJzVBE9jND7Quw6IZ/e02fYZtgJMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rigtTqqp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rigtTqqp"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so1200867f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751023410; x=1751628210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GADAYPYH6XtwZCwZvDUpQ7sXCaWC25QDTPuEwyrGf8=;
        b=rigtTqqpMFWHlagmaqgyirNORK3mQg5+2XquvfVSZTw+3Xq4Ejxtk4XJRHarbJsRxF
         xuHr/qxPsEIpuEXfXWykKAUjTItzM4zNfGpoZwKhiLs6wk/Nbykmm2Z2ZmVnoFHOiGyc
         EPxn86zmjSELR9lW3iaYrgw78QKd/g5nxwOEca8f9E/j31NQddp2PNaLQ3pdSNkU5f9B
         aRgX+DWy1wss8FdH7wr1f4eL71iNeRq3TuDPDO3newQBKM/HfGhAoO26amuR53Wo1bX1
         uqO5ixIUuPOo8/pXsA1w1LUEVLtx1YBRpjy3jZNsKNaDaKaUIrgJzziujc3fQCef9nKW
         /LYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751023410; x=1751628210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GADAYPYH6XtwZCwZvDUpQ7sXCaWC25QDTPuEwyrGf8=;
        b=XtxUQTl06PUTeuEt0LgPaa9fJ9LyILGc1aRtW/F97ZXFznf5MDN6xYxr053M1qMhI+
         XBCMflzlEdRNR1dSuwDGb5JEAjumhCkuttIi1F56vH+uND0vr5tL/AI+lO8pp2rOi/vC
         ubgxzuBKit1WyOQGTVPdIV7zJMm8mH9Ki7JzxTDHPVONgRLj+9d0yYoLjKL5CZPK+FTH
         cXImBZlzTuj9F7OOmlUKToVf33HDJH5wqlOvKf+y2Mw+zA/bWAymKMh9cSBqhsWm9IFY
         LvDfpJx2vbdzvobb1Y6gLE8sDfX8Ai4DVH2lPYd4IkXUH07uCHYXCE6vpYS0euKdQZw3
         nvYw==
X-Forwarded-Encrypted: i=1; AJvYcCUvP4UVXP5lJsEzi+m5aa7CyBEnlC7vB/7g6IUyIk6XeBhi7sZUXM7bA2vstHP+vlScbhg7ozzapoN5MJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTyr7JjN5GCLQ/F2GVymLehtnhBmzEW8tnCHBwAzqH50HsgoTv
	SPab1UmIlSUIp7HRiS4UliJ4RJh0TiGG3NsfQZhqxnPjktwtsn39Fqxu/ggiF8mlytk=
X-Gm-Gg: ASbGnctTTE5vRgSVoqWPm+8Rfl591gOP7H1pA0w8TSlpJ/cK6SZS70Qgvgh5pPN0qQF
	JQ6lTcfSUmOxUEn7lFUjC9znGFrCrEHvpPPMVXriT/JMRzJqhyMafwIhjcKi8t227O7tChT8lgx
	B6BUnQn9acXQaIe9HoLT32EHR9GhySmdiZt3ijtgyG0FeT3cjuvguIBVpUehaiXtyiZflUxuRlY
	LrCT5DaCTbmvqyhWcx6BVz90f7dWPxFSF6/K3QOqFWflT69FrZfCOOsylGjZ3bgrRHsnAXGXSuF
	M0J5wcWAxkpQWHNy+iy8I18RclqZ9NqRzaz2/Un6igCC9l5uETyeekgnjPWcP41e2FM=
X-Google-Smtp-Source: AGHT+IHpjRR+lhjSBz+H5Y+FWjh/7wV/egv/qDnpzKkXfpV6p0HxBrpcsCDQ+17zG3AKUjPpxcqhvw==
X-Received: by 2002:adf:b608:0:b0:3a4:cbc6:9db0 with SMTP id ffacd0b85a97d-3a902d88058mr2114575f8f.51.1751023410387;
        Fri, 27 Jun 2025 04:23:30 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa750sm2416679f8f.25.2025.06.27.04.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:23:29 -0700 (PDT)
Message-ID: <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>
Date: Fri, 27 Jun 2025 12:23:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight-tmc: Add configurable timeout for flush and
 tmcready
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2025 12:10 pm, Yuanfang Zhang wrote:
> The current implementation uses a fixed timeout via
> coresight_timeout(), which may be insufficient when multiple
> sources are enabled or under heavy load, leading to TMC
> readiness or flush completion timeout.
> 
> This patch introduces a configurable timeout mechanism for
> flush and tmcready.
> 

What kind of values are you using? Is there a reason to not increase the 
global one?

I don't think it's important what value we choose because it's only to 
stop hangs and make it terminate eventually. As far as I can see it 
wouldn't matter if we set it to a huge value like 1 second. That would 
only cause a big delay when something has actually gone wrong. Under 
normal circumstances the timeout won't be hit so it doesn't really need 
to be configurable.

> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-core.c | 43 ++++++++++++++++++++++--
>   1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 88afb16bb6bec395ba535155228d176250f38625..286d56ce88fe80fbfa022946dc798f0f4e72f961 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -8,6 +8,7 @@
>   #include <linux/kernel.h>
>   #include <linux/init.h>
>   #include <linux/types.h>
> +#include <linux/delay.h>
>   #include <linux/device.h>
>   #include <linux/idr.h>
>   #include <linux/io.h>
> @@ -35,13 +36,31 @@ DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
>   DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
>   DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
>   
> +static u32 tmc_timeout;
> +
> +static void tmc_extend_timeout(struct csdev_access *csa, u32 offset, int pos, int val)
> +{
> +	int i;
> +
> +	for (i = tmc_timeout; i > 0; i--) {
> +		if (i - 1)

I didn't get what the if is for here? Removing it does basically the 
same thing, but if you do want to keep it maybe if (i > 1) is more 
explanatory.

> +			udelay(1);

Can you not do udelay(tmc_timeout)?

> +	}
> +}
> +
> +static int tmc_wait_status(struct csdev_access *csa, u32 offset, int pos, int val)
> +{
> +	return coresight_timeout_action(csa, offset, pos, val,
> +			tmc_extend_timeout);
> +}
> +
>   int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
>   {
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct csdev_access *csa = &csdev->access;
>   
>   	/* Ensure formatter, unformatter and hardware fifo are empty */
> -	if (coresight_timeout(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
> +	if (tmc_wait_status(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
>   		dev_err(&csdev->dev,
>   			"timeout while waiting for TMC to be Ready\n");
>   		return -EBUSY;
> @@ -61,7 +80,7 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
>   	ffcr |= BIT(TMC_FFCR_FLUSHMAN_BIT);
>   	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
>   	/* Ensure flush completes */
> -	if (coresight_timeout(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
> +	if (tmc_wait_status(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
>   		dev_err(&csdev->dev,
>   		"timeout while waiting for completion of Manual Flush\n");
>   	}
> @@ -561,11 +580,31 @@ static ssize_t stop_on_flush_store(struct device *dev,
>   
>   static DEVICE_ATTR_RW(stop_on_flush);
>   
> +static ssize_t timeout_cfg_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", tmc_timeout);
> +}
> +
> +static ssize_t timeout_cfg_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t size)
> +{
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +	tmc_timeout = val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(timeout_cfg);
>   

Seeing as the existing timeout is global for all devices, if we do want 
a configurable one shouldn't we make the global one configurable rather 
than per-device? That seems too fine grained to me.

>   static struct attribute *coresight_tmc_attrs[] = {
>   	&dev_attr_trigger_cntr.attr,
>   	&dev_attr_buffer_size.attr,
>   	&dev_attr_stop_on_flush.attr,
> +	&dev_attr_timeout_cfg.attr,
>   	NULL,
>   };
>   
> 
> ---
> base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
> change-id: 20250627-flush_timeout-a598b4c0ce7b
> 
> Best regards,

