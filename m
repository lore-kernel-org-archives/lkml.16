Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239041F37D4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848335; cv=none; b=dhCcZNQeiX5YWP7Hqv7/UgkVA7cdpFK8g5LkbdNKyphSCPR0PVSNYuTum5dUdrmtHogIENb0K7L/k/Mk1I8M3lonmWW160uJDIX78JL7F8mdRaDoh6WFbEquH/74RhMgEcnfC2nbWIPEAUk1DBCLuA3RvY92t8vP9oqqHK8ZEag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848335; c=relaxed/simple;
	bh=odpDd1gWr0IWn7xRnQ6YNz9m6lRlJpHPaDvdXLxNWlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rP1iIYCDraS5PpASK6r4zwTkpoBytPe6V7cTxkOA2pZqYUJHwUd/gYqqCSI/pDsxkWpdugiZZRhcMQrBOMxAch66Hmoy250UPPbRnlfTlIDvpCmFCMGqR9BRBPIjVjA9MdaCMujf1DiqvEbnAEQ4cM4hLmXxPZsTq7ktU8USnMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVrC/BpG; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVrC/BpG"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so5737024a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749848332; x=1750453132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CA7SbjIvAHg3YcH0fCTJsNZVEjF7e1MXjvlpCZS+Uh8=;
        b=iVrC/BpGFy+9E2dzPFrvrmkJ30QR8UULFQ0Ymb5+TU0ggjKzRr950+VObXoZcm7sug
         ioG7Zt7M3tUxdMeFbnVAchNXbBPxt6j927Z43ntVd7fdvGVLxC1+UZgeBqlvwvturu8D
         LGmHz7uOtKDpPo4oEc6BzHgn3i730xqwv23r0D3i5yKuNx6TuI26se8/JOLJiMZGgFYS
         tih91iK0cZvmrKe2HpfHlqDA4gTuFdufzyJ842e18ema8s7Npk3vwmaG+cfy8bnZ/L2S
         k9DfnGV9XAzjBpCZEJWRsSKafFxw2Aw3XGuKPBtgPTe6Zb6j3f4hAPhLhbDCYggppdF7
         T/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848332; x=1750453132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CA7SbjIvAHg3YcH0fCTJsNZVEjF7e1MXjvlpCZS+Uh8=;
        b=g+O475JrICA2IY+TArk0JnYU1HgroUU8rzjPMBys4ZhAmt/9nU7otzw6eIgCIqPL7E
         InDa10TeyZr2w3WFsln9BZCMDtSuiODdoO1QJ4u4mq46bb0K5d7gvgGResNbMPSXxWTB
         YR4WTt3KInyBcXAWGBoeuLXuENVRPmchpSUD1ojCXOA6z3RMn25ynDJxwvLo/DReeC6u
         UCD1qOHANZGXiAGLb7+VURCHiOxIxLkBHdNg5dM91AYKci2jBQCVWVtSJAG4ahkbt+qN
         JSpdg/ZsFOgiDwKh5DqR78TH8XAgI6KbolO8u+woTG08MWKkCAjg2UZyjoKTTFaDasvA
         bGPQ==
X-Gm-Message-State: AOJu0YwOY3PSFEJCy+41UqTVZ4YxArHL5OdBui+xRcCmEMCNiCNIKLBr
	XC1A9Wb7I8VsY4yKCydmDgDCobyqLNwMJt1pJQQK7mr7p4jmCcd0V56U
X-Gm-Gg: ASbGncsvWha1p6Zn0EfZdcjQjuqzSPpkAcyi/9fDzqI4yawLAzLQmbUqDcIncS5kLhq
	m4veij9uCdFOLpu2b/nCFU6B9kwa009OzZueB3ni6+Bp3cmcMcLcnJHV+NteRIm3/m9+jbahDaR
	BvERgeK3oPX4ejAQJPPQFxq7CKssw56I8KQ8v6+qKaizMCPMNReBh5W8lp8fJ2SObbJ2yMLHPUO
	/bEbQuUBbBeM9hZATuU6+6utFeVAI2zsvHlAtyPj0Me63i7j6+4EIl3v9qxmqNo04dVW3kPM6Ie
	x/D0XJOxoBtiVEPyf1bMH8FjBn3t6DTHmB03w1fm7U6FN+WSbqpXnKduKldF0NLzHSgFvrGHCrm
	+
X-Google-Smtp-Source: AGHT+IGgUR6YRNoXhDc+3u34lUyWrCBGq4whypwHnYMMU1s6g2N433lNeRFQaGQ+tQIqbGYwtlYc0A==
X-Received: by 2002:a05:6402:50cc:b0:5f3:26bb:8858 with SMTP id 4fb4d7f45d1cf-608d09a2d16mr590577a12.34.1749848332237;
        Fri, 13 Jun 2025 13:58:52 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93a01sm1673352a12.65.2025.06.13.13.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 13:58:51 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] include/linux: Fix outdated comment on entry-common.h
Date: Fri, 13 Jun 2025 20:58:09 +0000
Message-ID: <20250613205810.773-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


> 'include/linux:' is not a valid prefix. See the documentation I pointed
> you to in the other reply.
>
> > From: Khalid Ali <khaliidcaliy@gmail.com>
> >
> > On most calls to this function, syscall_enter_from_user_mode_prepare()
> > never get called as the comment indicates.
> >
> > Privious kernel version i used to see things happen as the function documentation
> > indicated (syscall_enter_from_user_mode_prepare() called before
> > syscall_enter_from_user_mode_work), however it seems now some things
> > have changed which makes that point irrevelant. Most preparations that
> > function does is handled manually by enter_from_user_mode() and
> > some other places. So this makes it misleading.
> >
> > The point is remove strict function call indication on documentation as might be outdated
> > one day in the future. There multiple places currently called
> > syscall_enter_from_user_mode_work() without
> > syscall_enter_from_user_mode_prepare() get called so that will make it
> > condition not met.
>
> That's again incomprehensible word salad.
>
> You are right that the comment is not longer accurate, but your fixup
> makes it even worse.
>
> The real condition for calling this function is:
>
>    1) enter_from_user_mode() has been invoked
>
>    2) interrupts have been enabled
>
>    3) Architecture specific work has been done
>
> #1 must be the first thing. #2 and #3 have no ordering requirements.
>
> syscall_enter_from_user_mode_prepare() does #1 and #2 together and in
> the original implementation this was used in more places. So yes, the
> comment is outdated, but it needs to describe the above requirements and
> not something pulled out of thin air.
>
> Thanks,
>
>       tglx

Thanks and noted, however just asking why syscall_enter_from_user_mode() isn't calling
syscall_enter_from_user_mode_prepare() i don't get it why #1 and #2 is redone, is it because
of instrumentations since syscall_enter_from_user_mode_prepare() is calling instrumentation_end()?

Maybe we need to determine if instrumentation_end() is neccessary for syscall_enter_from_user_mode_prepare().
As i know the only place where syscall_enter_from_user_mode_prepare() is called is arch/x86/entry/syscall_32.c,
on that source when the function returns they begin the instrumentation again using instrumentation_begin(). So i think
with little adjusment of that source file and removing instrumentation_end() on syscall_enter_from_user_mode_prepare()
then we can use syscall_enter_from_user_mode_prepare() as we did. Yet don't know the reason, however suspect some duplication.

Another thing i should indicate if you don't agree with me is, can we change the comment the function to enter_from_user_mode(), 
and with little adjusment make steps as you mentioned.

Let me know if these ideas above right and whether i should keep going on updating the comment.
Thanks, Khalid ALi

