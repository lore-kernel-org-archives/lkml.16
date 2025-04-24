Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AD52101AE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486862; cv=none; b=rfHUngt0PHREmAku2rBa0sPm+AB4zfCFh6Ar9Z75+/6OciYhdGJJv4ZwQmQSeE+gcgyKgMtP1VI6z6iWBdpdz23lFgFEajlzNsUIkiBIIzQzBQMNto2M2Obn+013DNULGq6zTEE9eJd6G0Kw2aO2yQbR+7ZSXgdJ0fkcEz+2u4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486862; c=relaxed/simple;
	bh=9EvNLHrYcYjaMZub4SxFDAU0YvyTMQSX131moTDAXBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nx4YkTI6Yix9HUh6JYR3r6I7DSxlIG1z8lfRpaZ8usQyBUriJOvB+5vlAWeFOhLnF7IZ+fMkLaZZY9JW+mviL0W5iCuc/c4I21jFLIzIk7anDs3IhuAdfkz9eW+FvHMfFRLy9CJNfYphJa0LAPpvweNCApV9XLtKUwdLvM/zsXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=bVwZR/yT; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="bVwZR/yT"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso958988b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745486858; x=1746091658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nKG9AK9zhhNh+AoLcGVkthScwEaE4MVxkEVvxrkK6nI=;
        b=bVwZR/yTVHaqy6zgx/5nQLEfWbC7zshPFE7u6iaZtH6lxSUAGEIB75I8Hc+UZCT/rn
         Miq7xvG1aRl63eFtJKkHKxntx4YegHC/5LDNXDGkb427EbaeUfivKaKRMiFMXH2QGNVJ
         lM3r2QMJbuz82KT0gnwcc+OZTEiHrMDl2QKTJ0FcnNQZsVwnfvniUks8wMFDTUKfydqt
         6DykaDL46dh1ZJbjoBj5rGhYOwdIYQQSWDYlGw56NrOg8nco2klXl5YMpOM57eBm4jus
         6Y/hM/2MPExN6Xr8143B1eNFoxk1+pRkKv/p+ckIIBFOOUhG5vtCaslT4WtcyiatEWs8
         ZYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486858; x=1746091658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKG9AK9zhhNh+AoLcGVkthScwEaE4MVxkEVvxrkK6nI=;
        b=utYOuMojJ56n2nN9XuutpXi34cEDyPQ/u+seVHc9eSUBdvRz5zdxX86v8+nOVAfJy8
         A/bcWxriYjd2ncmM2rUA+3P+xyj8Rf/EDh7qQQ2qRoDjJheBbOaDqufNqrW0PKDm9zwX
         45wVOAe+XAPvi+wL+B8/IclaqX0NSDxodPLNbLa7uLYFoBzW5oQGz32Jo09+/29GRFXX
         K9cKeP1bLVUEd4QZB1NnaMYlQErmmMJetD8jPrm0mMr3O587mowad82i0v0D8UsOHu7o
         brb83/hEUkLR6HUIByf9ikn4Yj78hF8HJuLj9/zLttgDDqO+/HJ7Js7Z9CEHxD1WvpIJ
         AdmA==
X-Forwarded-Encrypted: i=1; AJvYcCXkO/KIXyy51moCzt5CkXJiuKuDZbVROI8v7Fzg7D+Vi7TLGO+EcXrBGHNPQh5fFCkeSwk8Xs6dx/IwMV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh6aGaOReh2glazN32cZ/KmO8EvvHK4LE/C44zuFpTVoPOe3Ep
	86ZSzHwXj/afiIM9qh6qva/jtQB0xsf+4uulhnn0uJqlbQV4iQBhOdq0Kio5ZVY=
X-Gm-Gg: ASbGncu5b5TRP1w5ykhTIyzVwvPFRNz8tNfp+Wluk+ccVLP0fmcB7H3WGrOlgDfoMoN
	MbHUHMnydoTuQ3dLp9mmyCluN1B60/GjYw3wsiO1hnac+4Aii3vLDc7qa/DT1PNVxqnAq3uktqZ
	gIy2PxE1UT7QwAsdj903Aa9XD/3yuftPNbw1ykjZqq9EfLK6ThaaaEVvcSoSjoc1Idsva9lFbCr
	HxZe8coQhpVZjU6vKzbkLJ7SxAkSxi9hopYkXN9vXcWht3J0HChC6cB5C3ok7hcP5KlPMlDlR1Q
	Po9455DybuaDzPJ0ruRAOSut0hyoZNyk+TPudZbBlNQ/xFM0tO3ut06ETMLHAvEh7k3D
X-Google-Smtp-Source: AGHT+IGQCWlR/Gvd/22emgp3MMxuSlSt431lKYewezjKjhXONRXVhnHGFW+j5y0M7kYAgKeYJISL+w==
X-Received: by 2002:a05:6a00:2d8e:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-73e24ae60c2mr2776086b3a.21.1745486858177;
        Thu, 24 Apr 2025 02:27:38 -0700 (PDT)
Received: from H7GWF0W104 ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912325sm980508b3a.14.2025.04.24.02.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:27:37 -0700 (PDT)
Date: Thu, 24 Apr 2025 17:27:32 +0800
From: Diangang Li <lidiangang@bytedance.com>
To: JiangJianJun <jiangjianjun3@huawei.com>
Cc: jejb@linux.ibm.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, hare@suse.de,
	linux-kernel@vger.kernel.org, lixiaokeng@huawei.com,
	hewenliang4@huawei.com, yangkunlin7@huawei.com,
	changfengnan@bytedance.com
Subject: Re: [RFC PATCH v3 04/19] scsi: scsi_error: Add helper
 scsi_eh_sdev_stu to do START_UNIT
Message-ID: <20250424092732.GA48639@bytedance.com>
References: <20250314012927.150860-1-jiangjianjun3@huawei.com>
 <20250314012927.150860-5-jiangjianjun3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314012927.150860-5-jiangjianjun3@huawei.com>

On Fri, Mar 14, 2025 at 09:29:12AM +0800, JiangJianJun wrote:
> From: Wenchao Hao <haowenchao2@huawei.com>
> 
> Add helper function scsi_eh_sdev_stu() to perform START_UNIT and check
> if to finish some error commands.
> 
> This is preparation for a genernal LUN/target based error handle
> strategy and did not change original logic.
> 
> Signed-off-by: Wenchao Hao <haowenchao2@huawei.com>
> ---
>  drivers/scsi/scsi_error.c | 50 +++++++++++++++++++++++----------------
>  1 file changed, 29 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/scsi/scsi_error.c b/drivers/scsi/scsi_error.c
> index cc3a5adb9daa..3b55642fb585 100644
> --- a/drivers/scsi/scsi_error.c
> +++ b/drivers/scsi/scsi_error.c
> @@ -1567,6 +1567,31 @@ static int scsi_eh_try_stu(struct scsi_cmnd *scmd)
>  	return 1;
>  }
>  
> +static int scsi_eh_sdev_stu(struct scsi_cmnd *scmd,
> +			      struct list_head *work_q,
> +			      struct list_head *done_q)
> +{
> +	struct scsi_device *sdev = scmd->device;
> +	struct scsi_cmnd *next;
> +
> +	SCSI_LOG_ERROR_RECOVERY(3, sdev_printk(KERN_INFO, sdev,
> +				"%s: Sending START_UNIT\n", current->comm));
> +

As in the scsi_eh_stu, SCSI_SENSE_VALID and scsi_check_sense is required
before calling scsi_eh_try_stu.

> +	if (scsi_eh_try_stu(scmd)) {
> +		SCSI_LOG_ERROR_RECOVERY(3, sdev_printk(KERN_INFO, sdev,
> +				    "%s: START_UNIT failed\n", current->comm));
> +		return 0;
> +	}
> +
> +	if (!scsi_device_online(sdev) || !scsi_eh_tur(scmd))
> +		list_for_each_entry_safe(scmd, next, work_q, eh_entry)
> +			if (scmd->device == sdev &&
> +			    scsi_eh_action(scmd, SUCCESS) == SUCCESS)
> +				scsi_eh_finish_cmd(scmd, done_q);
> +
> +	return list_empty(work_q);
> +}
> +
>   /**
>   * scsi_eh_stu - send START_UNIT if needed
>   * @shost:	&scsi host being recovered.
> @@ -1581,7 +1606,7 @@ static int scsi_eh_stu(struct Scsi_Host *shost,
>  			      struct list_head *work_q,
>  			      struct list_head *done_q)
>  {
> -	struct scsi_cmnd *scmd, *stu_scmd, *next;
> +	struct scsi_cmnd *scmd, *stu_scmd;
>  	struct scsi_device *sdev;
>  
>  	shost_for_each_device(sdev, shost) {
> @@ -1604,26 +1629,9 @@ static int scsi_eh_stu(struct Scsi_Host *shost,
>  		if (!stu_scmd)
>  			continue;
>  
> -		SCSI_LOG_ERROR_RECOVERY(3,
> -			sdev_printk(KERN_INFO, sdev,
> -				     "%s: Sending START_UNIT\n",
> -				    current->comm));
> -
> -		if (!scsi_eh_try_stu(stu_scmd)) {
> -			if (!scsi_device_online(sdev) ||
> -			    !scsi_eh_tur(stu_scmd)) {
> -				list_for_each_entry_safe(scmd, next,
> -							  work_q, eh_entry) {
> -					if (scmd->device == sdev &&
> -					    scsi_eh_action(scmd, SUCCESS) == SUCCESS)
> -						scsi_eh_finish_cmd(scmd, done_q);
> -				}
> -			}
> -		} else {
> -			SCSI_LOG_ERROR_RECOVERY(3,
> -				sdev_printk(KERN_INFO, sdev,
> -					    "%s: START_UNIT failed\n",
> -					    current->comm));
> +		if (scsi_eh_sdev_stu(stu_scmd, work_q, done_q)) {
> +			scsi_device_put(sdev);
> +			break;

Maybe this shouldn't break early. If one scsi_device fails to try STU,
the next one might succeed.

>  		}
>  	}
>  
> -- 
> 2.33.0
>

Thanks,

Diangang Li
