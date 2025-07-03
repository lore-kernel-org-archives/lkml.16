Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0E02EE276
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554318; cv=none; b=gpuIiTmiahspyQ6aHErn6ySA5DtGGDmlK2isIKZwFb3ct6zsbQXsAvKwikJqZA0L5plsoSzRD+S4R/pESjaKicydqH2zfE7Cf0YsTLqalS9KAloNE7D7oPFzCHyGGDwNA9NliVZ96RAlygigTmLKN2xQmyFDXjaHGooZfmCo5PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554318; c=relaxed/simple;
	bh=66osK99Upp/1YA05Y1DCJQ+Lcle3oUQTWTEUzXC0vUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dutbcZ5Z78cZCBH/CYYo2mT5FV4asnnYdGSEkhv6j/pjiYj8vYXjPpnA2ag0ooNGj4KVGvq7Pkytzo/NBM+GkKytpCil4IXYhJ2wqKlOtV8TPeq+1GnySQCvKRKwUzd9SR+OmE5tjtU8gtPrq6SpfSzMh/T7NH+M2eDny0njPAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 1F1FF140262;
	Thu,  3 Jul 2025 14:51:53 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id 0DD2320027;
	Thu,  3 Jul 2025 14:51:48 +0000 (UTC)
Date: Thu, 3 Jul 2025 10:51:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: Christian Loehle <christian.loehle@arm.com>, xuewen.yan@unisoc.com,
 vincent.guittot@linaro.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, hongyan.xia2@arm.com, linux-kernel@vger.kernel.org,
 ke.wang@unisoc.com, di.shen@unisoc.com, xuewen.yan94@gmail.com,
 kprateek.nayak@amd.com, kuyo.chang@mediatek.com, juju.sung@mediatek.com,
 qyousef@layalina.io
Subject: Re: [PATCH v1] sched/uclamp: Exclude kernel threads from uclamp
 logic
Message-ID: <20250703105147.13e10a77@batman.local.home>
In-Reply-To: <6414cb05-11d3-4b2a-ae97-7bb0ca0ea898@kylinos.cn>
References: <20250703091437.79861-1-zhangzihuan@kylinos.cn>
	<675563a5-8f1d-4249-9828-9fb353dd7dd1@arm.com>
	<6414cb05-11d3-4b2a-ae97-7bb0ca0ea898@kylinos.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Stat-Signature: m9jxtsuy6not3ifac85hi4xx1bhkwfea
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 0DD2320027
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/+r8pVHe0TSkd3rrltHniD9vTBj+hkkoI=
X-HE-Tag: 1751554308-562784
X-HE-Meta: U2FsdGVkX18S0EX7L+bDCABJHbSmDZMbGME5nTYINXKVbhngbpCcdahxQ4C1N6Yvy3vOyOKJx9l4vSQEQBJmCzJEwBU8YSbVK1MN+SI1P0tvPuU0xzKe3ibadbXqskaZxpZXolDE0Tk45YPYHcVekjaSB+dzgnolPf/qstbVaNOGJJrlma+/yIeLRWsbUba8xsQXO0hT91Ey7jH4pp+Ddmpzi123+9olx7lqHGu0M8i1Dvb32ET5a8w7ZqIa8L5jW9NaFR2y/c7KThmfhxRWLHsxH7oXfvxbo1EWnf2/Joyh+c9sy0YYGqkmXFhGV4Y8

On Thu, 3 Jul 2025 18:07:20 +0800
Zihuan Zhang <zhangzihuan@kylinos.cn> wrote:

> As Xuewen mentioned, some kernel threads may intentionally set=20
> scheduling attributes for performance. So instead of unconditionally=20
> excluding all kernel threads, I=E2=80=99m now considering a more conserva=
tive=20
> approach:
> skip only those kthreads that haven=E2=80=99t explicitly set any clamp va=
lues.

The above comment bothers me. What kernel threads set scheduling attributes?

=46rom my experience working on real-time, no kernel thread gets
scheduling tweaking correct.

-- Steve
