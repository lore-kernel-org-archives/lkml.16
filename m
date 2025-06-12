Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C34EC2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749717066; cv=none; b=tbHuH14urdZZzZMM64BUgnyUng+8fofujWNWXbMsgLl7DNQjJePI42RC7r+FFyVzbprnvaAL30tUjmDZm1YeHrIXsH82lyYZbUjNPy4SnTvlA732HoeHg9L7x9Ywnf6IZxNUsUEhcnk1Gg9ZFObmxobzi160XWPbSMRHAq0zn08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749717066; c=relaxed/simple;
	bh=WAcZZoaVqJVBCCp/zyaxoIzZMJP035kLTOD6rXXjCZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqgVlvgg9qv40PgGl6VcYwtfyr59OiqyXx0eFKZqI1QnvA++HgLYxCEhl4st2ZfAMS/RyAJeR9QdX3Hwak8tXekAJkGOHSwvwqZDsxalUYSjixo4vHo+cLVtxYAXQtM8pbmv7taUpo3UqLwL5aPD+q+88+oGQlwdImP1Ob2hvYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lbnTN3Uv; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lbnTN3Uv"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so656305b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749717064; x=1750321864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FpYtQBVzdFUn1mP60IhVAt0dlEC8nasoUhcUFbuwbTM=;
        b=lbnTN3Uvk9PM1MjBzX3+Q+Ssey5CooiixNsk+Eb5391aed9Tbi3GnPsXakMV7WN2e+
         2cZEMaM6PTtHxyCrPh4yOsZBP8p5FAn63jph77sxn2+dgxKoVumiPg6cjbTaaEj6N43V
         6tdpBaQt0ruA0fcEplkiL1//EQtaH/WYA1jL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749717064; x=1750321864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpYtQBVzdFUn1mP60IhVAt0dlEC8nasoUhcUFbuwbTM=;
        b=eyxtuckTeFKsF9KpKqHQGT9cQL0n8t6+UnUf9ziu97ehERECUrb9UYiBBu5V8X1su6
         gj4QI2B8e1m3jeFKlhdAxy+IawKYjB+ADjtyWyS5RPey8FixyJSOmE+BWTG8LWRbDAaz
         sYLmbnEElu1CrOpsnzieTooENowtdo7X05llI7A/+E6WMUHGQX6lOFbcL4hSZLKOPH2i
         kpl7sCiCZT47jwp3t2ON2mmuF5MZMqBIFgAkxCjNWLXsaRYaez0UilZzLWtaNPY11VW6
         1pZciILHTGYVpejc4lk0HbwK4T89+q728HLihLHd0NCycpt7rOGGzkI/9E7IXRhbc/+d
         V33w==
X-Forwarded-Encrypted: i=1; AJvYcCWJt74U74vnNTGVNLgu72g/jmZozti9JBLrhDcd6AqjDslMvxWt2HfvtP22FgJuGAYx4uNklvV+t0QyU98=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjXPlTZ5aT4VZAkfxpZR1P5LwFy6cdiUhV3vKVYFAkasWGoldQ
	uXqaMP7iifjWABos27NtANzH++bPlUDb3DxGnbZDpga0HpXzcZlp9I9kDX7L+YboMw==
X-Gm-Gg: ASbGncsL3pK7e3oXe0AQ5x3RXhGtUfR02cvWWCM2VHdUPdnFq1W1EvGrBDBbpWKpLgU
	GKHsFxQWOvquG2VteAiCvdz1T8keMv39uvTKAyj0is1R1CtaPvbfS3ybfDHosrJ9ZivP/ZL1d62
	OGWEPtFlLghtGYZ7AXf1mKM0z3kkYMJsTUKiYlc6ZKqlOTMA6sxyVaEX91SzecuW/BoBDEUagDr
	2oZ0Aj1jDbT0mSGGWGVp/pCzBmjTCjprvCho9ONR7Sj5LfUjyZ+7fC8AM3CNcDHNvXiYtlBx5gN
	WCfiF/jFEY1Kj8UEJmW2vtcKrPPrXDrHbVubnaTWIKle6C3wwJMt1HAKTEd3aXPw
X-Google-Smtp-Source: AGHT+IFBDWKNu3QDY5x77Ut+39tjoSMCPpg9YSXyyw7wdPIMWMB03qAOxrhzC+O4LvEzlruhxyx/fg==
X-Received: by 2002:aa7:8882:0:b0:73d:ff02:8d83 with SMTP id d2e1a72fcca58-7486cb21c08mr10126036b3a.3.1749717064126;
        Thu, 12 Jun 2025 01:31:04 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:fcb5:79e0:99d6:8d5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488087aa41sm893458b3a.31.2025.06.12.01.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:31:03 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:31:00 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] wifi: ath11k: mark reset srng lists as uninitialized
Message-ID: <kuawjsglndjvwmq2ki2kctvgcdci6mhfp7juux7tzo3g6h5txh@hddxo4o5raea>
References: <20250529035708.3136232-1-senozhatsky@chromium.org>
 <5857380e-ced9-4118-b9a0-ce926b25c11c@quicinc.com>
 <rxaibpgtf37w3th5lnt3w574w443yononqjoglyfktlcxe26qg@jpmtkckrotzp>
 <2f77045c-6763-4fc4-bf09-50fd9b76a394@quicinc.com>
 <xr3n5pbohquhaloonctfqvpb2r3eu6fi5jly7ms4pgcotqmqzh@msrgbaawafsj>
 <ce3c0e51-4df0-4164-adcd-e98f2edee454@quicinc.com>
 <qqhs2mzhg6mgq23wej5a65iau4ysfjh2raakcsvwc4fuqtpwk2@4ouqfld6mrnd>
 <d48a228a-5f48-4732-b12d-78f03541ae9e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d48a228a-5f48-4732-b12d-78f03541ae9e@quicinc.com>

On (25/06/12 16:14), Baochen Qiang wrote:
> > <4>[23562.576034] ath11k_qmi_driver_event_work+0xbd/0x1050 [ath11k (HASH:6cea 4)]
> > <4>[23562.576058] worker_thread+0x389/0x930
> > <4>[23562.576065] kthread+0x149/0x170
> > <4>[23562.576074] ? start_flush_work+0x130/0x130
> > <4>[23562.576078] ? kthread_associate_blkcg+0xb0/0xb0
> > <4>[23562.576084] ret_from_fork+0x3b/0x50
> > <4>[23562.576090] ? kthread_associate_blkcg+0xb0/0xb0
> > <4>[23562.576096] ret_from_fork_asm+0x11/0x20
> > 
> > 
> > There are clearly two ath11k_hal_dump_srng_stats() calls, the first
> > one happens before crash recovery, the second happens right after
> > and presumably causes UAF, because ->initialized flag is not cleared.
> 
> So with above we can confirm our guess.
> 
> Could you refine your commit message with these details such that readers have a clear
> understanding of this issue?

Sure, I can do that.   I didn't want to throw my guesses into the commit
message, stale ->initialized flag looked like a good enough justification
for the patch.  But I can send out v3 with a more detailed commit message.
