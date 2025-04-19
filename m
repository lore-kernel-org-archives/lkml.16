Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098EB2AD1C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 02:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745031209; cv=none; b=QxBDWKsSE+nVE2RRCZn6Zk6WSGE56jDfo+vINDJhCeQmucu7hNr/CuGRLTI/c4FJy3dvBbogPJrDaIJ2yxOxhjiKBwQPrXQN07DVdGfeBXPe+nfug0ZNB5EAHRbJkZsIak79qgcs+dSfKglA+9LdXpaBCbHIn7L7uv5rKsDhT58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745031209; c=relaxed/simple;
	bh=UuJYNB6rYkrZrohvvpTtvlU1rLTogN1AI0WOxTxR6FM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M/gnrOW9QC7me1SOmAWJt+OVH8Usy2rpEZghBtQpTwBRXJwccVDwNKynrQls/Ae0u/np3kXMy3Lgv6Z4v4k7jIfZAr+aNgcsctvMDMOyF6/wMZkSdrjDPQ5JzS9dEBsOM3UKmBABvLv8UzRPDzTPlMi9UdpHJyD6LyADiB411lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=efault@gmx.de header.b=e9CPw/ne; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=efault@gmx.de header.b="e9CPw/ne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1745031192; x=1745635992; i=efault@gmx.de;
	bh=t0GmCaFlbIMWirTc5jRMMpyQ6CJ5ZAVjDZ+DH3p3t80=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e9CPw/neNy5jVx29NL+qaZIXorCKjnk0gXDAyWz0k1ha+phhFfkYUkkIhvBnkBFX
	 UhLEivoVvrKJhjCW1ncAMatx4k5IEkaLM/ZcpF+lh1v3XT60tStRPTO7b6jbIwzoM
	 xtRdpbsCNSED0sP9PlTGJQ722t9HyQZasZ53URibytT7T7YKmktGRV7T1WrgmOsxB
	 QTEXSn3Iw12OCIhWmjdr3mh+NfL4pN5xA+KS3uJVsGGar5KtJ1UtiAyvcpHHdyzxW
	 zrtjgvonmnhY4xUhZpBTEuSS9zCHGmVj+8aeIwFyECO4x53zt0or+OGuxm2mXWTAy
	 S9tJ8j+XBCEVrBIHvQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from homer.fritz.box ([91.212.106.41]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MlNp7-1urBFl0DIT-00ongj; Sat, 19
 Apr 2025 04:53:12 +0200
Message-ID: <3083fb0006f3f872ae8e7fee5b53e1bd6d3b2373.camel@gmx.de>
Subject: Re: [PATCH] sched/fair: Add null pointer check to pick_next_entity()
From: Mike Galbraith <efault@gmx.de>
To: Peter Zijlstra <peterz@infradead.org>, Rik van Riel <riel@surriel.com>
Cc: Chris Mason <clm@meta.com>, Pat Cody <pat@patcody.io>, mingo@redhat.com,
  juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,  rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com,  linux-kernel@vger.kernel.org,
 patcody@meta.com, kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Date: Sat, 19 Apr 2025 04:53:08 +0200
In-Reply-To: <20250418154438.GH17910@noisy.programming.kicks-ass.net>
References: <20250320205310.779888-1-pat@patcody.io>
	 <20250324115613.GD14944@noisy.programming.kicks-ass.net>
	 <7B2CFC16-1ADE-4565-B555-7525A50494C2@surriel.com>
	 <20250402082221.GT5880@noisy.programming.kicks-ass.net>
	 <b378f48593ca7449257a1bb55e78b186d88cd9f1.camel@surriel.com>
	 <20250415080235.GK5600@noisy.programming.kicks-ass.net>
	 <20250416124442.GC6580@noisy.programming.kicks-ass.net>
	 <abffc286b637060f631925f9b373fad114d667d6.camel@surriel.com>
	 <20250418154438.GH17910@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bBBYI9dVkvKzzZlSzJOhXfQJNoxPGss3HUB/z8TzT/dgh2Arqrs
 3E1Fsuh5oxtNAPCVLQUpelrhSWcKBS4T5g16O5RBnKtHe2FhHguQLEj3zE+8S3dULLX0eEx
 KOAsNhe5ki4Ieje2uvzHPwSamZp4yDeNaN9wCtylXYc1Sq/BbKilC9xQlOGAEOW3Smr6cbE
 V6XZq5yV9Z6vO9iRG5iEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5+Vowruws3w=;an+rJ//uQ/AT7dNUeCJmKPjg2Du
 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
 0ApRBnJth6iHZen4asNYV9tQJE3rqSc=

On Fri, 2025-04-18 at 17:44 +0200, Peter Zijlstra wrote:
>=20
> However, due to PREEMPT_NONE, it is possible (Chris mentioned direct
> reclaim and OOM) to have very long (in-kernel) runtimes without
> scheduling.

Dunno what Chris considers 'very long', but FYI you can take some
pretty awful hits even sans PREEMPT_NONE.  In 6.12 time frame I caught
move_expired_inodes() eating 66ms, and isolate_lru_folios() holding
IRQs off for 78ms via dirt simple kbuild+bonnie on spinning rust.

(fugly bandaids for both linger in my 6.12+ trees compost heaps)=20

> (I suppose this should be visible by tracing sched_switch)

(I used modified wakeup_rt that only traces max prio)

	-Mike
