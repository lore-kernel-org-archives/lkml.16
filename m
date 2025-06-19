Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9078F1E7C2D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750301615; cv=none; b=JB/UWncPJesUMUR13/sc4WYQ0po4yhsgELc09ZBuhw2Jiu5pITipZAqpZBubrI1RJFYHFmEKXJoFMm0pVW1wQPZtH+xnBeJiOE6Bd9ePV+u6sNIYbj4B7/qT3eXcFlQiOyjfLfZ/YZRJ1xpmrwFiAy3nF6z9Ms4kIxLT1e8ruWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750301615; c=relaxed/simple;
	bh=OsdN13/dSed9kBQwRJxxWTY3QfS6d80pDSHIWWLDRmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UffbDzNZclXWOErqkRyloA4jsWlYSNCiTA9wsALkakrZs76SqvtbauZcWvRiS1Be4u4Pdq6GkngxNN0eL3/Wiqgi4riMYnkBiy6DWmADe7M/CgQ9cXm34JLoR9nq9ayscqGm2p5zvjYPv5q/DSesfMp7oy/c1a2+lU3huyzONxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ayBthVzA; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ayBthVzA"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b1396171fb1so234800a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750301613; x=1750906413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FU7hS3nxP2s1VnD1O6EqAa6UCfOLId0EKfwYuX88Apo=;
        b=ayBthVzAZbc0N2UEw/ff0eXYSYxcbET1tji6nbrCBGz5EYSErOX7TfLS7U7fub+Ycj
         sPIuMdta51FjPdwl28SBC5RQtAT24PaS3KkEHwc1qnlF/dDOzgTTVoX2N4glWzYLcEo3
         M8NPxrow5uzsez637LKB82s7/jNn7Gxuanjn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750301613; x=1750906413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FU7hS3nxP2s1VnD1O6EqAa6UCfOLId0EKfwYuX88Apo=;
        b=l7EK49gYIXuM+V7oJsYPpip3oM80weo+9EbWFAe7ykO2gh0w/AeJlN6QYgP19iEb2j
         Rnn0SUYWlVvnuOjKNGcWnbsc9zUxKhNl3WJBhdi/16y215DnspXuoqrRAthe9HVvuXOZ
         V7y8KY/VkOQbTXBk/yL4REEltwvt2Ibe07KZjNb18IMt8hqiTqL92TvUfY/d1NEIH8OW
         ioLVJP0XiKcocLMwDqLoGlYP9QgcHQPbavprP3Y96vyGEvsoXHYSp/TtRUH80ab0yt0O
         /9WtkxOtVy6//kAF2iaQxGmYBeI9vy4hlon7qQfz3IuEaXvEqJdOFpNKAxWA66EW9for
         dKhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR8Hk1sYldUULaSmzq8Mej5F3vhoe3bEqYhNeedNhIc/lSUjoyF1jWdRTmJvdPAVBBjxdch3oCkct8ha4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH14D/nJuG3CtOZ/qTNLc8wtG1Wt9rlmNrqXORgUePP/1gK+pu
	B1vCPLPKs2A+XX7ylrRZ539APTo7Q1KjfhZMgTWPh5gezv3+QXyeTp7mXUmUE6YnpQ==
X-Gm-Gg: ASbGncvjyikxsGaFdaHRec3af3ZjBqmgSFwr2V3qogs83jYUtu22W/wyjyy4+oZ8Xk8
	xvBFMiZQNGcCtmZzjCeb+qGstyU/htTTATRdBJrmN5UKyrqktBODdPJgsBCklVqNjnUAe9/YlCb
	f33QMvp3b/Ym9MxzfXFkMtCXrHCx8bn/2rijfJRiFd9g2gyg0lLywcNlxPARn4SKisOfMfdTUqb
	46PlqqpthmC6F2+DNAvVFQ5/tq10dfdCMEbsptKnUbCpRuF3eemyaYoV7J/CpK20D9KDGc98kDJ
	8KRqyA3ij2GOpbwv6QRqQKeveqWdFWduVoysfpjl+/5/vV3HTUOlvyU/aXRBSBgHmA==
X-Google-Smtp-Source: AGHT+IGNccPkiKMjhJp9xYP7Kep1hqlT//YVjWo3nk5z9pz6Nus1LaUm0/pUREXGtm7Nq43cBr8sEg==
X-Received: by 2002:a05:6a20:7f8b:b0:220:3a5:43e9 with SMTP id adf61e73a8af0-22003a54b20mr9849038637.32.1750301612935;
        Wed, 18 Jun 2025 19:53:32 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:7cb6:ce70:9b77:ed3b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31c1b48c69sm3688361a12.31.2025.06.18.19.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:53:32 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:53:28 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jeff Johnson <jjohnson@kernel.org>, 
	Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv3] wifi: ath11k: clear initialized flag for deinit-ed
 srng lists
Message-ID: <xgypo7y24oxfe57psg6bdzrmvmahx7swb2ifjxqmpteagsdonw@ubrubygzpbyo>
References: <20250612084551.702803-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612084551.702803-1-senozhatsky@chromium.org>

On (25/06/12 17:45), Sergey Senozhatsky wrote:
> In a number of cases we see kernel panics on resume due
> to ath11k kernel page fault, which happens under the
> following circumstances:
> 
> 1) First ath11k_hal_dump_srng_stats() call
> 
>  Last interrupt received for each group:
>  ath11k_pci 0000:01:00.0: group_id 0 22511ms before
>  ath11k_pci 0000:01:00.0: group_id 1 14440788ms before
>  [..]
>  ath11k_pci 0000:01:00.0: failed to receive control response completion, polling..
>  ath11k_pci 0000:01:00.0: Service connect timeout
>  ath11k_pci 0000:01:00.0: failed to connect to HTT: -110
>  ath11k_pci 0000:01:00.0: failed to start core: -110
>  ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_EE_RDDM
>  ath11k_pci 0000:01:00.0: already resetting count 2
>  ath11k_pci 0000:01:00.0: failed to wait wlan mode request (mode 4): -110
>  ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -110
>  ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery
>  [..]
> 
> 2) At this point reconfiguration fails (we have 2 resets) and
>   ath11k_core_reconfigure_on_crash() calls ath11k_hal_srng_deinit()
>   which destroys srng lists.  However, it does not reset per-list
>   ->initialized flag.
> 
> 3) Second ath11k_hal_dump_srng_stats() call sees stale ->initialized
>   flag and attempts to dump srng stats:
> 
>  Last interrupt received for each group:
>  ath11k_pci 0000:01:00.0: group_id 0 66785ms before
>  ath11k_pci 0000:01:00.0: group_id 1 14485062ms before
>  ath11k_pci 0000:01:00.0: group_id 2 14485062ms before
>  ath11k_pci 0000:01:00.0: group_id 3 14485062ms before
>  ath11k_pci 0000:01:00.0: group_id 4 14780845ms before
>  ath11k_pci 0000:01:00.0: group_id 5 14780845ms before
>  ath11k_pci 0000:01:00.0: group_id 6 14485062ms before
>  ath11k_pci 0000:01:00.0: group_id 7 66814ms before
>  ath11k_pci 0000:01:00.0: group_id 8 68997ms before
>  ath11k_pci 0000:01:00.0: group_id 9 67588ms before
>  ath11k_pci 0000:01:00.0: group_id 10 69511ms before
>  BUG: unable to handle page fault for address: ffffa007404eb010
>  #PF: supervisor read access in kernel mode
>  #PF: error_code(0x0000) - not-present page
>  PGD 100000067 P4D 100000067 PUD 10022d067 PMD 100b01067 PTE 0
>  Oops: 0000 [#1] PREEMPT SMP NOPTI
>  RIP: 0010:ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k]
>  Call Trace:
>  <TASK>
>  ? __die_body+0xae/0xb0
>  ? page_fault_oops+0x381/0x3e0
>  ? exc_page_fault+0x69/0xa0
>  ? asm_exc_page_fault+0x22/0x30
>  ? ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k (HASH:6cea 4)]
>  ath11k_qmi_driver_event_work+0xbd/0x1050 [ath11k (HASH:6cea 4)]
>  worker_thread+0x389/0x930
>  kthread+0x149/0x170
> 
> Clear per-list ->initialized flag in ath11k_hal_srng_deinit().

If you are with this, can you please pick it up?
