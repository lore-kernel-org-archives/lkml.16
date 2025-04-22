Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C1D14C5B0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344194; cv=none; b=hiAGt5ZAEQ0u6V41SqJ/x68VfxsoNb+qzh6RmHlRL37y8d02iE1DAQOF8xfbfmUzn94/+ovmemfU/UDkS2TxeHYsyCT+P1pcAuZnLwAhqEWP3S/DfHhT6aNDHgb7rFN/2DEf9J1XtijmV4HAdKxU8xVJr3wfk0kHL1AApwfruY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344194; c=relaxed/simple;
	bh=KLQi+z0ACwlFz9ZbLyqfwIt8qa5Lxh81zDr6UDorl7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BvYzleDwrmaDya9pQ2Fe8KeIxwg31kvvahvgZXrjcs4fki54gTo1BBmaxvFPl5/wHONs2NJueSz3AsQjRzPNSVLu1FxGsE5UJvmrTFi/iddD6qnrEiPWZkm+Eas+6RQcq2DBPyfSPGNOoqYWkVhE47HMi+fFKvFDxk+1/jJDQP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IkUQCqoS; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IkUQCqoS"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso7494046a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745344190; x=1745948990; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fpG9W7SDN8EuvqFXYfDUvD424TP++3YcyI7qbI7RVys=;
        b=IkUQCqoSsvbmJZobBfZfqNEd8juLpSa75MPis5ovxr6Rm7TG4n9uHlW19ycjjp0mIp
         AK6eWzINdeWsk8t2fe2/nfozXlJzOxKctygqWtIu0PFV9jcwQwV1Y44/9+k9naa3YPv7
         pkL+9n68wYBp5oPi87R3VMJge4whiUbU1skb/Jj2ThbJl//qq4xugm9Zo650befl2PJM
         /l4JC+r1fvX2YLM/RMgGXA1Q5OwvYFaOmDJZtc5OAd374gauFRw9Xc3i+w4rbwvrUtge
         8YxGXHRZD8cD27Rdxl4R84+20U7Sd9fkwjwoyWOgZKNEBLgauROrzskgW+SJTpW59yLQ
         zAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745344190; x=1745948990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpG9W7SDN8EuvqFXYfDUvD424TP++3YcyI7qbI7RVys=;
        b=YbKHVeraYz7Bh5xQ34VvYSPo8CUERt0/rp/xFBAfAn5tdKj4jmWlqWWZe+ZrbyKYo3
         Qd6s5K6OZKNNTb1e+HcBK6mFanQxYm+i31aqqr+lD/yEKM6ZFYmRy3cWWcMKGobq9kWw
         eqXkmsSdNYxls3lAEHdYBgxY8VpyLOYa0Aby5+H8C/+tQ6Z1KgaQCfhg7wRp3ACDpZ3W
         z9sMRKX5pgKH4FVBf5kY+YApdW5017t+7F/YoRN9QuMcvjzwtfmBW/Su7xk/b1X/tO6L
         ft39hqGZBaIO4QjUgzKZ4StAL8vU9qGdiddp/tApSdkA3dEA2CjRH3DyLMN9h8MPpNg8
         JB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpaYAv1+d/cPBeE0r0mCn1gBd5gwcuqo7l1CJH6wkOv9TR6QB4gciHUlHiOSRk35TjcubaVLbnvshn+aM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkmPmPsxVV5OiaUEq1GV+3sMFQnLsVmcr0Nh4t3E350H71Bm7+
	t/pbP14EAALsdlEaBtwK8Yv+mK4/3r1BUOnC6CpkgGXEaR8dJaOfyws3oBzP9IClGC2Xxf+XQAW
	FGnOBO6h/va276RQhGrGeWTwB9lBLriq1apkCBpHRBLMxue3tYv0=
X-Gm-Gg: ASbGncvaJNg2Yvz6USzDuzd9DXZ0Do0/tbnUcFnNCldtmJC9DDU8u3oUp+pi8rH2LXf
	lgYuXfUnFeRWX2ZBtI5JyRAJnV7+UBA/e2mUkxA5pUge6TuhAbbGbzPBJf+ZPDSETqQsKH4/Hnn
	1JvoEMtx10gHuuUiHm2/pc+PkW5MuZggwAa/tgM1bUX6tv3r6YNvNWV020
X-Google-Smtp-Source: AGHT+IF082irkvGuWqbNJrgDGvzzill1KS5KY/0o1UO6awot+Tg4DLEc3+Y0l21XSqr/7CEo+BjQncxpVrlQf0NZcTY=
X-Received: by 2002:a05:6402:430d:b0:5f5:7c7e:4107 with SMTP id
 4fb4d7f45d1cf-5f628621dbdmr11785472a12.29.1745344189500; Tue, 22 Apr 2025
 10:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414184600.1166727-1-tanmay.shah@amd.com> <aAe80OlwWENHI2I9@p14s>
 <072f2139-a860-406b-96b8-aa59a83950ee@amd.com>
In-Reply-To: <072f2139-a860-406b-96b8-aa59a83950ee@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 22 Apr 2025 11:49:38 -0600
X-Gm-Features: ATxdqUGRLKjR-TRghu4jLx6CoHjZVS-CNK5SiVm29m6LptEOatjHqt618H_Cl2A
Message-ID: <CANLsYkzDCy1QWY23uwVz_35tjdUdATqc66QA=sp5=gSY2vUnRQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: xlnx: avoid RPU force power down
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 10:10, Tanmay Shah <tanmay.shah@amd.com> wrote:
>
>
>
> On 4/22/25 10:59 AM, Mathieu Poirier wrote:
> > Good morning,
> >
> > On Mon, Apr 14, 2025 at 11:46:01AM -0700, Tanmay Shah wrote:
> >> Powering off RPU using force_pwrdwn call results in system failure
> >> if there are multiple users of that RPU node. Better mechanism is to use
> >> request_node and release_node EEMI calls. With use of these EEMI calls,
> >> platform management controller will take-care of powering off RPU
> >> when there is no user.
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>   drivers/remoteproc/xlnx_r5_remoteproc.c | 29 ++++++++++++++++++++++++-
> >>   1 file changed, 28 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> index 5aeedeaf3c41..3597359c0fc8 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -380,6 +380,18 @@ static int zynqmp_r5_rproc_start(struct rproc *rproc)
> >>      dev_dbg(r5_core->dev, "RPU boot addr 0x%llx from %s.", rproc->bootaddr,
> >>              bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> >>
> >> +    /* Request node before starting RPU core if new version of API is supported */
> >> +    if (zynqmp_pm_feature(PM_REQUEST_NODE) > 1) {
> >> +            ret = zynqmp_pm_request_node(r5_core->pm_domain_id,
> >> +                                         ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> >> +                                         ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> >> +            if (ret < 0) {
> >> +                    dev_err(r5_core->dev, "failed to request 0x%x",
> >> +                            r5_core->pm_domain_id);
> >> +                    return ret;
> >> +            }
> >> +    }
> >> +
> >>      ret = zynqmp_pm_request_wake(r5_core->pm_domain_id, 1,
> >>                                   bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
> >>      if (ret)
> >> @@ -401,10 +413,25 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> >>      struct zynqmp_r5_core *r5_core = rproc->priv;
> >>      int ret;
> >>
> >> +    /* Use release node API to stop core if new version of API is supported */
> >> +    if (zynqmp_pm_feature(PM_RELEASE_NODE) > 1) {
> >> +            ret = zynqmp_pm_release_node(r5_core->pm_domain_id);
> >> +            if (ret)
> >> +                    dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
> >> +            return ret;
> >> +    }
> >> +
> >> +    if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) < 1) {
> >> +            dev_dbg(r5_core->dev, "EEMI interface %d not supported\n",
> >> +                    PM_FORCE_POWERDOWN);
> >> +            return -EOPNOTSUPP;
> >> +    }
> >
> > Here I have to guess, because it is not documented, that it is the check to see
> > if zynqmp_pm_force_pwrdwn() is available.  I'm not sure why it is needed because
> > zynqmp_pm_force_pwrdwn() returns and error code.
> >
> Hello,
>
> Thanks for reviews. Yes you are correct. Actually instead, the check
> should be for version 1 of PM_FORCE_POWER_DOWN. If version 1 is
> supported, only then execute the call otherwise print the error.
> Hence, the check should be something like:
>
> if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != 1) {
>         error out.
> }
>

The above still doesn't answer my question, i.e _why_ is a check
needed when zynqmp_pm_force_pwrdwn() returns an error code?  To me, if
something happens in zynqmp_pm_force_pwrdwn() then an error code is
reported and the current implementation is able to deal with it.

> I will fix and add comment as well.
>
> > Thanks,
> > Mathieu
> >
> >> +
> >> +    /* maintain force pwr down for backward compatibility */
> >>      ret = zynqmp_pm_force_pwrdwn(r5_core->pm_domain_id,
> >>                                   ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> >>      if (ret)
> >> -            dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
> >> +            dev_err(r5_core->dev, "core force power down failed\n");
> >>
> >>      return ret;
> >>   }
> >>
> >> base-commit: 8532691d0a85ab2a826808207e904f7d62a9d804
> >> --
> >> 2.34.1
> >>
>
