Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D857219A67
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447999; cv=none; b=FmIwB0R6lE/G5xR+kVIJLoqwTsD71Xkua+88LlWekPySXh0sLZneLe+f0dbaOS2k9fgRJ3XchYxDsH06vDdlPtAEeAS9dSGuJ1UeyJfbmYbeu9kIMpLsYgT6Jo2FQ/Lr56jzPLuqNY5hbYgRibrH22pAaTyIBdPjdvJ0qIeB6XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447999; c=relaxed/simple;
	bh=R6HoO9utzNAyt23BET7OrJlz4hwYGXX+QNpyGY6nmpQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DTT8dd9q2/Rirtu8lQRB+GLnayDfLbadcyB0EPtR658o/5ynt25Ze8SLw01eAsWMIHeiBO994cer2rlTBkNrWtGI2blUsxf2Tlw8GTTnUfUddiNiquJsr2NhImT9KdfL8UNPzm3u0lqTWgzNcndl411mQUcNdmFDLMdbBZlLmAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=vecPV4+N; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="vecPV4+N"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3ce886a2d5bso39143855ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743447995; x=1744052795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdVyUczeJWic0WGQFRDHoRFIuz1e6rkv6Z0rZI+fogM=;
        b=vecPV4+NcjBKZxvci09ryChOORKh/n/VMIf2ER71IkShBfT/FNy+Ai/PmNuUWS7YsR
         JWyOOVs1lEZaQ584VdEjgmh1oX9M2v3j7KVDDjOYHZaTcvaclcdyokQqPzKii9bkS3k9
         RbEzjTfjHJy7RWFp6E+1W0V9VGIUbBxa+VutQdsZExmJTmr9xdjKzleliAedORnbpcqH
         m2xKvQMXdS1KP+VD+dEFIrxq8Motc8xpIS7A24WSZWhUvvfVLbaGRg7A+/G5h6Ixnp4u
         ulCwylZD0/0kLpxwgiqAbALs1bqk9aqTDdUmTHv36V6mmyWdf1ckFx55shPakKGQNb4p
         PiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447995; x=1744052795;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdVyUczeJWic0WGQFRDHoRFIuz1e6rkv6Z0rZI+fogM=;
        b=u3WJU7uz/4az3V/SkrLy6H6RcSuWi641hGE7DO5rpXtpx1U9JNfrfLY35u0/PjzTeg
         OotzALyr2RhjaqeY77bgPQKScGVHqcq5dr9OhhytVP36p7Ghzem1lOk/9dKKedVsoaPP
         x+0ipeW0DcN331TSIytK0vVFxyiFdxqyarnl4sNXmLedl4zwJi2N6wVDIxkLaIQWSj8I
         vM25i0DsA6Q9KUBgRSd8tgcJ0rTsyNC0mnwDNUjBDDKH45unWocWWBcESCk2QCPeliwB
         soOxDVTTwsicEfIRM07hNTZAFubWL6LShZFpa1fOPY0IwBt9JcaH+OEH/AAhxPN1euNT
         RLFw==
X-Forwarded-Encrypted: i=1; AJvYcCUIh0LEwHNay2I+gZmMX5q9Rpdz0vKbwpWOEk3Ha2kaF1JcpEsKxJm2VhWM2STOTLKYtcXZqxwuL/VM+VE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqylCqyZ/JC1pta/zGWaghx8QTKy/J5XGpT3omtGliSH1t0YLu
	bnx1tx6vQXby/ZTwiFu4NFgj2XBz3fE0SA+6IRtjqKl/7Up8UniDWgbms3h/qbw=
X-Gm-Gg: ASbGncvcJXhhSFAjU8aXO/FxE0AQ+yNFyrvkiosrY8KuC4JydSt9QD1Mas0d4b/HdMe
	2YWY2ELr1jrWeF73K5dnesgco71TfAzMkQNwYjYuUo/OJdeLRw9+kZw7C549ZH//q4YZm/S8AOg
	TOZY8fNH8woRIW6wD4h9uRE60CTf7knC1o7qzWEMKUOxhzcUnZXIMCNij/jmDDdHKUr0NYvpzgM
	9F2gSURVT7+656OwFP3PMitBeZrfjRAf1I33LxTjLM+PwTxVBoTHHF/NfyVIowF1iX4jXxQxHFg
	b5inNGU7Te9NEozzkFKYnErMV99m9L9wrRg8
X-Google-Smtp-Source: AGHT+IFsxImJWmlzj0bwdAadBWG5vlsc90rZeFVRrBs5cjWqMGjs0KMH/Ata4U5Tofg9/H/MTEKVUg==
X-Received: by 2002:a05:6e02:164b:b0:3d4:244b:db1d with SMTP id e9e14a558f8ab-3d5e090720amr97784525ab.6.1743447995215;
        Mon, 31 Mar 2025 12:06:35 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f46487193dsm1995145173.79.2025.03.31.12.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 12:06:34 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250329161527.3281314-1-csander@purestorage.com>
References: <20250329161527.3281314-1-csander@purestorage.com>
Subject: Re: [PATCH] io_uring/wq: avoid indirect do_work/free_work calls
Message-Id: <174344799393.1769197.3886261668995690740.b4-ty@kernel.dk>
Date: Mon, 31 Mar 2025 13:06:33 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Sat, 29 Mar 2025 10:15:24 -0600, Caleb Sander Mateos wrote:
> struct io_wq stores do_work and free_work function pointers which are
> called on each work item. But these function pointers are always set to
> io_wq_submit_work and io_wq_free_work, respectively. So remove these
> function pointers and just call the functions directly.
> 
> 

Applied, thanks!

[1/1] io_uring/wq: avoid indirect do_work/free_work calls
      commit: 842b5d5f87039d978a9748f8728cabe07a676252

Best regards,
-- 
Jens Axboe



