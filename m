Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A9F25C6EA
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746458739; cv=none; b=YnFNB0qaws1tmQC3eVqIBmqHrES+HadtCWb2V8DtZmy5ou5Z/yG1khqRsmfHUKijQ3CCM9zQat+T/YzTxxwLutLXC1z9R++qp8nyWcMYSSEfL7UilbmGysLGnYqE5ONlO1wW088rGKVFFOew8mfHKJvZD4cdztOHdHKiwv/fBfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746458739; c=relaxed/simple;
	bh=dI4E2Kbf751wzsz59sPzsKmHk4663cGlXUspDFJTyek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNNYAIjtsjwIEoAOEvJBuW9bdp91j7pecX299r6KD2KWaAuicYi3hD3p/p3cSMeIPIg8BJ4wiryQzuWmNPNQVe5emc/ZbnpMws6zVwho/j2QR4MgavwlfyzTwGMge7UdEztf8aJbYelD2emuc8/LTkRulZGCwHAj4wU9oiIbb/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H9JG1gT6; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H9JG1gT6"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so510564866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746458736; x=1747063536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ajJLa5miM3AL5goGOKRZtkQ1TmX4V3MyI+Ci8KWiok=;
        b=H9JG1gT63FNaZObb2fHVq8bmoilOaBq99fb4kqh1fnet2xJZLXkvY9YmfLxEebyOw+
         sz/FI8pDBJQmWwJM4HrzKc2z3pXB03HFs3FplAqRiutvx0v6QE0BDKXavMWrSKLNg24k
         j2Mf6Mpmqb0Uqa2jJWjYtMBVwvWR5blal7NzuZVaie98jPBiPCa5pRd5xrEluSzsCZPa
         iBYmC3imZO40SLOPK8p280Z2CU5REsyO2EuGvUPcxrtFe8DcKllwUctVrn5nkfq35K29
         W6Xcoe8aSfdIJHAqhdEoTO+Z15atwJiPO/UBDAwqqnAd62MkspJVgdx0n3hrJVHcBpTI
         7JPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746458736; x=1747063536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ajJLa5miM3AL5goGOKRZtkQ1TmX4V3MyI+Ci8KWiok=;
        b=m1N0qLINrpa4b6DqP51eTyWEQnHES+ZJLgXikCVYUzDWsD08hYiXWgNR3zKSvdg8FR
         /HyVIE+XP8yLLK3BLy3THrM69piNF9+tkuC/oOCMG282mvbb7BFN1NSxM9WX478PHnJG
         Nzys0kq/kbYPUkhbUjdvzz+dRnRo3ZvddqScR1VoI8paU+9ux2Qn8Jzv5ohpqe1k5D1C
         vXOHiFjrnT0rIst3GsgsrFXTGR3mLXgrhgwv475WRdxtIk6c1rAoFynzuLkG32hQ3jz/
         9JHMzP9qkkg9N2cuoJtnQrF5U15rJLPi9tuqYHryt+VU8U29p9tnf2QMuv2yWtPF8vMP
         izTg==
X-Gm-Message-State: AOJu0YwavyMuS2D31WXE0btzjlR9NSSwdXljapc6pJ7mGq34LlK6UTcG
	kh9N1Iiyp5P7BgzncWviyFSYXvLtdlyoznkPyPYJW3csY5eftpdbyKYvP4n7f4s=
X-Gm-Gg: ASbGncvOLdqhof6H02/27+7j4nzxbRnVts/oGZMgQMTijhOyeAve4b58NZow8F7yYT/
	o9JqCT6hLZHB/ptBZ3LOvVoilxAnx7aF/tb+DUrrUYWQr4yOwyIN2jLZ1F85ClULRAd2C9wjZtk
	kge9lzxROSMJ1vyfUdJkMS5HI3Wsn+/qPSShqr5XsRbRLqV5oGQJR7fki8XiOC/16Q9eHPJQ4V/
	hPlQd3A1mf7t4wiOLX73YZG8BlkjeWh0f7CpP58KWYwRysVmZoqnOG3f+8QDv9cJBhV9wcii4ec
	t3Wk6W/SsKykFVj7Y92WUrUCgy5TPyfDv1RgYik3CMMpJQMzOUk=
X-Google-Smtp-Source: AGHT+IGYG7m0T03TgljojHgEjhUKNwr/b12nUjKBhKn/d8sk3hJq1ietBujLlydEzb85jA5VfGNXkw==
X-Received: by 2002:a17:907:9406:b0:ac6:f6e2:7703 with SMTP id a640c23a62f3a-ad1a48bc5d9mr610686166b.8.1746458735844;
        Mon, 05 May 2025 08:25:35 -0700 (PDT)
Received: from localhost.localdomain ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914733esm506520166b.33.2025.05.05.08.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:25:35 -0700 (PDT)
Date: Mon, 5 May 2025 17:25:33 +0200
From: Petr Mladek <pmladek@suse.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	andersson@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
	tglx@linutronix.de, mingo@redhat.com, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	peterz@infradead.org, mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
	konradybcio@kernel.org, dietmar.eggemann@arm.com,
	juri.lelli@redhat.com
Subject: Re: [RFC][PATCH 07/14] printk: add kmsg_kmemdump_register
Message-ID: <aBjYbXJL-GJe4Mh8@localhost.localdomain>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-8-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422113156.575971-8-eugen.hristev@linaro.org>

On Tue 2025-04-22 14:31:49, Eugen Hristev wrote:
> Add kmsg_kmemdump_register, which registers prb, log_buf and infos/descs
> to kmemdump.
> This will allow kmemdump to be able to dump specific log buffer areas on
> demand.
> 
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -4650,6 +4651,18 @@ int kmsg_dump_register(struct kmsg_dumper *dumper)
>  }
>  EXPORT_SYMBOL_GPL(kmsg_dump_register);
>  
> +void kmsg_kmemdump_register(void)
> +{
> +	kmemdump_register("log_buf", (void *)log_buf_addr_get(), log_buf_len_get());
> +	kmemdump_register("prb", (void *)&prb, sizeof(prb));
> +	kmemdump_register("prb", (void *)prb, sizeof(*prb));

This looks strange. "prb" is a pointer to "struct printk_ringbuffer".
It should be enough to register the memory with the structure.

> +	kmemdump_register("prb_descs", (void *)_printk_rb_static_descs,
> +			  sizeof(_printk_rb_static_descs));
> +	kmemdump_register("prb_infos", (void *)_printk_rb_static_infos,
> +			  sizeof(_printk_rb_static_infos));

Also this looks wrong. These are static buffers which are used during
early boot. They might later be replaced by dynamically allocated
buffers when a bigger buffer is requested by "log_buf_len" command
line parameter.

I think that we need to register the memory of the structure
and 3 more buffers. See how the bigger buffer is allocated in
setup_log_buf().

I would expect something like:

	unsigned int descs_count;
	unsigned long data_size;

	descs_count = 2 << prb->desc_ring.count_bits;
	data_size = 2 << prb->data_ring.size_bits;

	kmemdump_register("prb", (void *)prb, sizeof(*prb));
	kmemdump_register("prb_descs", (void *)prb->desc_ring->descs,
			  descs_count * sizeof(struct prb_desc));
	kmemdump_register("prb_infos", (void *)prb->desc_ring->infos,
			  descs_count * sizeof(struct printk_info));
	kmemdump_register("prb_data", (void *)prb->data_ring->data, data_size);


But I wonder if this is enough. The current crash dump code also needs
to export the format of the used structures, see
log_buf_vmcoreinfo_setup().

Is the CONFIG_VMCORE_INFO code shared with the kmemdump, please?

> +}
> +EXPORT_SYMBOL_GPL(kmsg_kmemdump_register);
> +

Best Regards,
Petr
