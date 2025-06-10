Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9DA239E96
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573558; cv=none; b=dTNdl13LFs3+s9/reAxVgDiHeP0vluYOZB6D3yTSWGadD998cFehaUGwKtNTc6od8AEz77Un0AKk+FTkWFx1Gn973PO0EvbCDp2lP0FJ//llOdahfTeORqkrIfpZ6ZkOKuKc58IlbbpvumJD/Y4TlKM7GRNpWfubdhGZUMdodXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573558; c=relaxed/simple;
	bh=dGexg9C3xYhVsDsglyZb2vlbwP6Y25viJTv1xhEDfiY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fTnILCy1EIJE41A3UqpMBzm5nc3ARsd4I+kTLs0RlyFQT5pf2zqpa3+fKwdD5uTCkyU7ZaRQTeETV2eW71Po+PQgoQKA5L++wvAKN6cKT05GUbGa+4U9H0fmNJm5pJ5d3lDpw06IH6dAL2zMp0ynsUmX7nKLoCpUZWtBA1Ce6Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 02859C092E;
	Tue, 10 Jun 2025 16:39:13 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id EBAFC20037;
	Tue, 10 Jun 2025 16:39:11 +0000 (UTC)
Date: Tue, 10 Jun 2025 12:40:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "kprateek.nayak@amd.com"
 <kprateek.nayak@amd.com>, "vineethr@linux.ibm.com" <vineethr@linux.ibm.com>
Subject: Re: [PATCH V5 1/6] Sched: Scheduler time slice extension
Message-ID: <20250610124042.46b54b51@gandalf.local.home>
In-Reply-To: <7BA85550-4E33-4C5B-B855-716512D2105E@oracle.com>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
	<20250603233654.1838967-2-prakash.sangappa@oracle.com>
	<20250604103106.1465f847@gandalf.local.home>
	<20250604145433.KCPMF8zm@linutronix.de>
	<80120491-7F90-4171-9FB8-9FE89B09F728@oracle.com>
	<20250604192327.sVjt6c4u@linutronix.de>
	<20250609165532.3265e142@gandalf.local.home>
	<20250609173333.6e0b6a55@gandalf.local.home>
	<7BA85550-4E33-4C5B-B855-716512D2105E@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ncsfoo8amj47g54rxdi95gm5nwxccwin
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: EBAFC20037
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19LWZV54/aFZKIWa/qCm0Z90lv3mXwRwqo=
X-HE-Tag: 1749573551-668732
X-HE-Meta: U2FsdGVkX1/cwlVWpYmxFLXlonR6WeG6vvzTDpsdBRKK2l9OtSqYPMD9qRJJPIEkbzSqzG2wXYlkktUcz+b4OtUFBx6FQSxoANxXvoODhniC85q1rg1VRhKasursoYQBWBjURKa+hdfv0MNidbo36+3JyCdIzWqGBpF27MZ3ejbPX6m3o5JsPhnOI/U6zgw9RalV+3D93VK4bJLPKxy5pGOl/9Ajhll0nRVYR9vd9pEy2svUsAG84ASI1ZHQyVHDpNM3X299Gutcnn4Hw2Z+0D85GiISBsjXlvlDD/+UO54sjZZqpR3voo94K+XPFP4UsB3Kkdcf3VGTWxoXfyS8XBU/BrOiImhu11UVP8C03Q0afNPRAZQmww==

On Tue, 10 Jun 2025 16:31:05 +0000
Prakash Sangappa <prakash.sangappa@oracle.com> wrote:

> Ok, adding load also seems to increase the max latency.

Right.

> 
> It is up to Peter to decide if scheduler time extension should be restricted to non RT threads.

Peter was against restricting it to just non RT threads because he said it
wouldn't make a difference. He asked for benchmarks that says otherwise.

I'm now supplying the benchmarks that say it does make a difference.

Hopefully Peter will now change his mind.

-- Steve
