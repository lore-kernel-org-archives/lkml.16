Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E739E1804A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751561775; cv=none; b=bk4hyVCOBmPqFBpu/ajTFjv+aVpkX/+svIh8ecBVLDS8f7FYThiN4MfUP2J+BnQJTCHn3jGE2E9u5unRsPLIstBmr5H6ESP+a5a6CgPiAOD9pNF3bdhOjeayDnvvv0SZtBNQCXm/meoTTIOEFtOCAMfbJ6oERqfeHWcYpF98RNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751561775; c=relaxed/simple;
	bh=2u1r5WhkbWRJ4A8OZRQFXYhcLgU7v3KG8yidx97jCsw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=psRJJARZDR9XgOegaykhTKFyCBLUtiItrRn/NHA/ya/NOjgY7L98YKXyhGMGGVDbyysckOGpu7ngXB6PA0HM+Fqzc18hUW8mbvQJddje8ac2Y+HC4KI5ttYIpoY3lWAuup8c9VleVatM57unuOPEpC4nri2+HsRQ43dKI/LaC90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qve4Ujc+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MGbBHLR8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qve4Ujc+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MGbBHLR8"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751561772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nIGeJMLrzyx/RfyUTZprCydDkvwjop7CmikTg7OBOeE=;
	b=Qve4Ujc+JgShf2KfvxJZvolt0pXpLbEDVkrNMFOQOLqVidJQRavk4c0co50BXzO3MhVYfq
	dgm8MPq8aqQIEtNZNoCJ2NnovDmeBd3bAU3LiSLlICaPmDEwd8otOqTp+xPmH54gndviKz
	0Koww5nJvavYehGxmV5Iq6aklz4ipijlTFBVMTR6yHNdRDRmKZFjlghJad9l+D0vu9Vq80
	Nezso7CVAzn8YPefwa3H/nouWEgMNaKZtqJxhiR02+iTifsydw1ffkIbpXLW5DgcAxex9Y
	PaeLOEbt8JlXPW/HrqV8847hXbg5ZS266B+hhenwBDbQ/SNV2BEMojG4AMdvmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751561772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nIGeJMLrzyx/RfyUTZprCydDkvwjop7CmikTg7OBOeE=;
	b=MGbBHLR864EdiZtsEkbKp2OK+JQUWG8uNORePPT7JB+2V6ZUbdROvE2yV+d8ux/NzTc+Ww
	hJe3pY3Hb/ApUhDA==
To: Rik van Riel <riel@surriel.com>, Yury Norov <yury.norov@gmail.com>
Cc: Jann Horn <jannh@google.com>, syzbot
 <syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com>, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 luto@kernel.org, mingo@redhat.com, neeraj.upadhyay@kernel.org,
 paulmck@kernel.org, peterz@infradead.org, syzkaller-bugs@googlegroups.com,
 x86@kernel.org, kernel-team <kernel-team@meta.com>, David Hildenbrand
 <david@redhat.com>
Subject: Re: [PATCH] smp: Wait for enqueued work regardless of IPI sent
In-Reply-To: <20250702135954.7a00497d@fangorn>
References: <68653927.a70a0220.3b7e22.245d.GAE@google.com>
 <366d45aea0b64cfc82c0988ae5fe6863bbd28261.camel@surriel.com>
 <CAG48ez2_4D17XMrEb7+5fwq0RFDFDCsY5OjTB7uaXEzdybxshA@mail.gmail.com>
 <CAG48ez1VMw=aE88eTfk9BscrmS7axJG=j_TrTui+htLF9-4Wqw@mail.gmail.com>
 <874ivuldog.ffs@tglx> <aGVwAtUi8eKNT8Jy@yury>
 <20250702135954.7a00497d@fangorn>
Date: Thu, 03 Jul 2025 18:56:11 +0200
Message-ID: <87ikk9tdqs.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jul 02 2025 at 13:59, Rik van Riel wrote:
> Thomas, please let me know if you already reverted Yury's patch,
> and want me to re-send this without the last hunk.

I did so immediately after saying so in my previous reply. It's gone in
tip and next.

Thanks,

        tglx
