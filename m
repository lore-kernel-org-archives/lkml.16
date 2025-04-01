Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53581CD21C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530012; cv=none; b=eVeJ7XHwm/TnceN37deIlRjTwqfyCyvo+gpCOLYoTUQWq7SzPF1Zh36qOAmkfhVDc6KcDW7Q3/ZDIl6VqSNifnxLH/+R5ZLrpkuL/FNGqR2yBocE89Yx+2pcO1hLPV5Iathprn0uxvisNqVw72o45mX2Supi/xn/rgthMuXetDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530012; c=relaxed/simple;
	bh=wvxv/waaZRYWdWdRl8DiKQfy8QKutFbWJ30fzUtiepQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irmHPgQC71yrUL6XMB1Cn3WHpHI8FfTkA3CwntbUOHl/y8L3lF9dk9Zg760KOpYwu+hHqVynKgurIuoftAzx6c2+lkT8v566n5otzvb32mOidE9T1OPx0MNOIHJutMBIbzO0+KAsRPN99ddB90VcbPc0J8Ft/2/m1QnDhcnkYw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kAsIbBwJ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kAsIbBwJ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2240aad70f2so25555ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 10:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743530009; x=1744134809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BuKW3U5k2j2K6O9+vgWNZIMpH46cUSnt1lE5fqVAeDw=;
        b=kAsIbBwJTRyEkdg2sM29pT9iIWxVJon6Bd2hSaAl4HPR9XfhidYPy3DsRqRrG64Kup
         p3s4fYDDG+joF99Ls/CiQLeWcgvY9n4eBWRxF5o2ln8LsqDk+McM9190zeIgQlJPaZbm
         6cYovdMOPcgbMxIhxSUcjdJ6bGG3TJ5rK3C7IZn8VMPQvwb9Y50Mgov1lTjzmQ03TE+d
         Q9gE2OP+2srmYldtxmIGcBGS3p/RcKZOE9MgWAGMjzPdxaEYH8b1QR3w/eeRxakJwOdi
         WfI9QPt20xdj5AjaReaJVRXVb9vprqVVLiq+Q7WQBQdH+g+18/4TKhlwM+2HYrORtBfc
         LH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743530009; x=1744134809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuKW3U5k2j2K6O9+vgWNZIMpH46cUSnt1lE5fqVAeDw=;
        b=nj2ae4e9wnWuxdATRVAEIyOe3/vSN7gul9yS3+SJFaiZxmPcCTQVdq8NeXawCDM+gQ
         qPToIpHXmBaE7+MaaxRbzqABn3K4tm+Jli6NrqgobJx+xkqgQppKPEbVULKTSSFFuwf4
         QXn6U3/lE4eug7pNh9FzeOZ0cVCo3xUqSqZY5gD2FH5xvtPfUPmRRqx/AJz11gFjQ9FJ
         t27/L+dJ3ZXaMBGKzL+y2phYk4iDS1WCEY9bVvF+rVItE5/GMOu7+k//W7mWjELM+6Fn
         kdmiIOzO4iyrZHbf594ybwlZXSnvcy380+cwoJP9L4TzgRSqrEzrGtPg1oxN0E7IMnjC
         WU8w==
X-Forwarded-Encrypted: i=1; AJvYcCUr7FILxGViuKKeQ27ij1y5snd80HogifYzjVSnALfC7U3k3w2+QI+5SI27qG1RjQw1tkHPWQzljWfAgXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0v0s8CHV1HPckf8kfJQP4/MIHfnsNw5blDmsWgN+Q2N+j7iCX
	lnAYCwkeVVFqDCuj7PaBeQ+end/7tTNnEqq45sufBf214J2eKJ2ltSezCRNpWCONncy1V53s6t1
	Mhg==
X-Gm-Gg: ASbGncvmJeRdZdXnGkVqkmfsFPKCoE9ofiw1+AN2jmHCoCvRbXjfAF/TIleAPzzeHrZ
	K1qtp0AS2weB3/4p/MsIdsjvSLfUGwl18wfAFggvHzgIMz37mY3s1lWkwDYLzBuMht/DhFg2xAY
	TqOAM2fFTycGHucbcpOlazCJPYNr3z6bUTHFef+MGYsAms+EKShTVJSjr0DtT2jkpC6ku/c5uzl
	Ny6rUNaGPoCqx8ewy1iqE5bj2m4tr0lBAyaM74/KJn65+GhIjpVfJ8Gjnip5sjLMLYxOGTuHX+Z
	V4AhQT1unbj+HTZbw7TrHKwgdSHoUE86MxIp/7RiA/mn//nGFEDfVbImm3ioOAWSk4JW9uUeP1E
	syLqr
X-Google-Smtp-Source: AGHT+IEVr+rrpkDgaLR90xqnLOJyMtMDGV16JBYFAjbEnnQcc00GqpDLdvHapwtSIKNOP+NTkIDzrw==
X-Received: by 2002:a17:902:ab87:b0:21f:465d:c588 with SMTP id d9443c01a7336-22969e0ca96mr152925ad.14.1743530008725;
        Tue, 01 Apr 2025 10:53:28 -0700 (PDT)
Received: from google.com (24.21.230.35.bc.googleusercontent.com. [35.230.21.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e29342sm9532445b3a.64.2025.04.01.10.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:53:27 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:53:23 -0700
From: Igor Pylypiv <ipylypiv@google.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ata: libata-scsi: Set INFORMATION sense data field
 consistently
Message-ID: <Z-woE4LfU4qlFmez@google.com>
References: <20250328183047.2132370-1-ipylypiv@google.com>
 <93ec66ce-4fa3-4913-a0b5-9debe47ef8b0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93ec66ce-4fa3-4913-a0b5-9debe47ef8b0@kernel.org>

On Tue, Apr 01, 2025 at 04:33:55PM +0900, Damien Le Moal wrote:
> On 3/29/25 03:30, Igor Pylypiv wrote:
> > Populate the INFORMATION field with ATA LBA when sense data is obtained
> > by the ata_eh_request_sense(). Kernel already populates the INFORMATION
> 
> s/by the/with
> s/Kernel/The kernel or s/Kernel/libata-eh
> 
> > field when sense data is reported via autosense or when it is generated
> > by the ata_gen_ata_sense().
> > 
> > ATA PASS-THROUGH commands, unlike regular ATA commands, populate
> > the INFORMATION field with ATA ERROR, STATUS, DEVICE, and COUNT(7:0)
> > fields thus setting ATA LBA into the INFORMATION field is incorrect.
> 
> Could you rephrase all of this is a manner that is clearer ? That is, describe
> the problem first and then how you fix it. As-is, this is hard to understand.

Thanks, Damien. I'll rephrase it in v2.

> 
> > diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
> > index 2796c0da8257..7e93581439b2 100644
> > --- a/drivers/ata/libata-scsi.c
> > +++ b/drivers/ata/libata-scsi.c
> > @@ -216,17 +216,30 @@ void ata_scsi_set_sense(struct ata_device *dev, struct scsi_cmnd *cmd,
> >  	scsi_build_sense(cmd, d_sense, sk, asc, ascq);
> >  }
> >  
> > -void ata_scsi_set_sense_information(struct ata_device *dev,
> > -				    struct scsi_cmnd *cmd,
> > -				    const struct ata_taskfile *tf)
> > +/**
> > + *	ata_scsi_set_sense_information - Populate INFORMATION field
> > + *	@qc: ATA command
> > + *
> > + *	Populates the INFORMATION field with ATA LBA.
> > + *
> > + *	LOCKING:
> > + *	None.
> > + */
> 
> The function name is clear enough. We do not need this kdoc block to clarify it
> and this is a static function anyway.
> 
> > +static void ata_scsi_set_sense_information(struct ata_queued_cmd *qc)
> >  {
> >  	u64 information;
> >  
> > -	information = ata_tf_read_block(tf, dev);
> > +	if (!(qc->flags & ATA_QCFLAG_RTF_FILLED)) {
> > +		ata_dev_dbg(qc->dev,
> > +			    "missing result TF: can't set INFORMATION sense field\n");
> 
> Why ata_dev_dbg() ? This should be ata_dev_err(), no ? With your change, this is
> not supposed to be called without the rtf filled...

I used ata_dev_dbg() to match ata_scsi_set_passthru_sense_fields(),
ata_gen_passthru_sense(), and ata_gen_ata_sense().

Last year we settled on using the ata_dev_dbg() to avoid a potential log spam:
https://lore.kernel.org/lkml/ab9f6564-3df1-4061-93e7-32a59aacb205@kernel.org/

Thanks,
Igor
 
> > +		return;
> > +	}
> > +
> > +	information = ata_tf_read_block(&qc->result_tf, qc->dev);
> >  	if (information == U64_MAX)
> >  		return;
> >  
> > -	scsi_set_sense_information(cmd->sense_buffer,
> > +	scsi_set_sense_information(qc->scsicmd->sense_buffer,
> >  				   SCSI_SENSE_BUFFERSIZE, information);
> >  }
> >  
> > @@ -971,8 +984,7 @@ static void ata_gen_passthru_sense(struct ata_queued_cmd *qc)
> >   *	ata_gen_ata_sense - generate a SCSI fixed sense block
> >   *	@qc: Command that we are erroring out
> >   *
> > - *	Generate sense block for a failed ATA command @qc.  Descriptor
> > - *	format is used to accommodate LBA48 block address.
> > + *	Generate sense block for a failed ATA command @qc.
> >   *
> >   *	LOCKING:
> >   *	None.
> > @@ -982,8 +994,6 @@ static void ata_gen_ata_sense(struct ata_queued_cmd *qc)
> >  	struct ata_device *dev = qc->dev;
> >  	struct scsi_cmnd *cmd = qc->scsicmd;
> >  	struct ata_taskfile *tf = &qc->result_tf;
> > -	unsigned char *sb = cmd->sense_buffer;
> > -	u64 block;
> >  	u8 sense_key, asc, ascq;
> >  
> >  	if (ata_dev_disabled(dev)) {
> > @@ -1014,12 +1024,6 @@ static void ata_gen_ata_sense(struct ata_queued_cmd *qc)
> >  		ata_scsi_set_sense(dev, cmd, ABORTED_COMMAND, 0, 0);
> >  		return;
> >  	}
> > -
> > -	block = ata_tf_read_block(&qc->result_tf, dev);
> > -	if (block == U64_MAX)
> > -		return;
> > -
> > -	scsi_set_sense_information(sb, SCSI_SENSE_BUFFERSIZE, block);
> >  }
> >  
> >  void ata_scsi_sdev_config(struct scsi_device *sdev)
> > @@ -1679,8 +1683,10 @@ static void ata_scsi_qc_complete(struct ata_queued_cmd *qc)
> >  		ata_scsi_set_passthru_sense_fields(qc);
> >  		if (is_ck_cond_request)
> >  			set_status_byte(qc->scsicmd, SAM_STAT_CHECK_CONDITION);
> > -	} else if (is_error && !have_sense) {
> > -		ata_gen_ata_sense(qc);
> > +	} else if (is_error) {
> > +		if (!have_sense)
> > +			ata_gen_ata_sense(qc);
> > +		ata_scsi_set_sense_information(qc);
> >  	}
> >  
> >  	ata_qc_done(qc);
> > diff --git a/drivers/ata/libata.h b/drivers/ata/libata.h
> > index 0337be4faec7..ce5c628fa6fd 100644
> > --- a/drivers/ata/libata.h
> > +++ b/drivers/ata/libata.h
> > @@ -141,9 +141,6 @@ extern int ata_scsi_offline_dev(struct ata_device *dev);
> >  extern bool ata_scsi_sense_is_valid(u8 sk, u8 asc, u8 ascq);
> >  extern void ata_scsi_set_sense(struct ata_device *dev,
> >  			       struct scsi_cmnd *cmd, u8 sk, u8 asc, u8 ascq);
> > -extern void ata_scsi_set_sense_information(struct ata_device *dev,
> > -					   struct scsi_cmnd *cmd,
> > -					   const struct ata_taskfile *tf);
> >  extern void ata_scsi_media_change_notify(struct ata_device *dev);
> >  extern void ata_scsi_hotplug(struct work_struct *work);
> >  extern void ata_scsi_dev_rescan(struct work_struct *work);
> 
> 
> -- 
> Damien Le Moal
> Western Digital Research
