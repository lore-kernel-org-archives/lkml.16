Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EE42882B2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531567; cv=none; b=rZhmCbqskClkBX7r1nBnpubtY6IjVd/jnMZd3RKZqxgK2qIQzdSJx9gyd3BOoCJxcr/Mv2LvBDSXBRmxCIU61is7Dh3dgxwOgrjlbFDsRxGh4W1EiuNdlPPRnHTra+I11GnPUN4q8G6+OlVsBtyHbRFTtJpDjZlXmV19kkYOH/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531567; c=relaxed/simple;
	bh=pC4oyzU5QcKM+U5qjC1NfBHbms8A+3U9vcCj9TQL6tk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ak476tom6r0VcBO4zsUlj6i4IkDKoSmqKi+vG9KbDCCRX/koEiAOZl/ETVZ2UbebIifzNZWfGYsKNHY4D2UqkMlhgZLVEfginYhiHq/k0FsYC3ae27rFFivg94mgpairXPZ4p41dnARvocPPDTOAgsM/4BteZ45MWk3Q2oQqM8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C3XNOLAz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GMNRCD7X; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C3XNOLAz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GMNRCD7X"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751531557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6Y6DcRJJDZCyIgqWReUtxmgc9vatazYHbrU0BksGVE=;
	b=C3XNOLAzLS/urbFkcLFvTb+ZdPxuZ43LuCep2RU8MIrd/Nw4lxzXRZ3X0gVDJG/FsXFZqR
	jb3MhE3H7rgPtq5M7Ccwl/6ApBlLefgy/vQKIVOXtrJTep5j8+JJhuruk74OKr9orknzMd
	z6idEgIOtuoOOZwRpb4MHw4UjHqRDtsF4YiLyr8MOe6XtZ1+Unp/YZbar1nx+2mPNLqGjz
	ZOltl8UTJePhmKXHyYY45TdbbvLdz43nlW+Qi4fMlUSHBSVum5V8NiOYewWr23n6EfFwZM
	3WwdEf6bYpkhBnDIsrU0BPbuUvMuGZ0C0sjsM1l3E4ZFHeR5GBZWmqaRlg2Z7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751531557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6Y6DcRJJDZCyIgqWReUtxmgc9vatazYHbrU0BksGVE=;
	b=GMNRCD7X2h7I/71aIS8aF5NltnrAcTmrZHDhuIksBJn2MXOxpJlzx2n8QzuIEksL/i5H8b
	n5FH9gAYafOrGrAA==
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "mathieu.desnoyers@efficios.com"
 <mathieu.desnoyers@efficios.com>, "bigeasy@linutronix.de"
 <bigeasy@linutronix.de>, "kprateek.nayak@amd.com"
 <kprateek.nayak@amd.com>, "vineethr@linux.ibm.com"
 <vineethr@linux.ibm.com>
Subject: Re: [PATCH V6 1/7] Sched: Scheduler time slice extension
In-Reply-To: <E5C37D1C-F220-454B-B152-4E30C2D7827C@oracle.com>
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
 <20250701003749.50525-2-prakash.sangappa@oracle.com> <87cyakmhdv.ffs@tglx>
 <20250701105653.GO1613376@noisy.programming.kicks-ass.net>
 <87wm8skrzj.ffs@tglx> <E5C37D1C-F220-454B-B152-4E30C2D7827C@oracle.com>
Date: Thu, 03 Jul 2025 10:32:36 +0200
Message-ID: <87plehwu6z.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 03 2025 at 05:38, Prakash Sangappa wrote:
>> On Jul 1, 2025, at 5:36=E2=80=AFAM, Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>>
>> Also if we go there and allow non-RT tasks to delay scheduling, then we
>> need a control mechanism to enable/disable this mechanism on a per task
>> or process basis. That way a RT system designer can prevent random
>> user space tasks, which think they are the most important piece, from
>> interfering with truly relevant RT tasks w/o going to chase down source
>> code and hack it into submission.
>
> Could the per task  control mechanism be thru /proc?

Is that a serious question?

> Wonder how easy it will be to administer such control.

Obviously it's horrible.

That's what prctl() is for. Plus a proper inheritance mechanism on
fork/exec along with a system wide default which can be controlled via
the kernel command line.

> Alternatively, can we have a config option to apply to LAZY only?
> This will not provide the finer  control as you suggested.=20

A config option is not solving anything; it's just a lazy hack to avoid
the hard work of a proper and future proof ABI design.

Thanks,

        tglx
