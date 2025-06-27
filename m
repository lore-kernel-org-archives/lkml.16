Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D706919F461
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025698; cv=none; b=ZfKbyDcIr+kUwPqiTdegQop7NbitMvqK+P0BK6RoC5VuBV19v0TnWtTSyWRx+kp+GU00Xa/Zale7330Caqj3viVZne8xNTpbA3odbA7PUcd0MmYExlX1PUCBy3rgJ4DgWa4ZvqfhFG0lgqvEvDO60SG0LTRqUTsg4xGmhltVBNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025698; c=relaxed/simple;
	bh=dveS3dz0/tVYs2oYeHsTlR9eW66aOO/Bg7sniYE5tSI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=aaY7BCFLMrktFcdDW7J00QcjEHa5FBSsBbWRo7iywGfciq7TC3rMtttYhupuYwVUxovlK0o7uayxmNcsjvaF+oXyUlH7KWAL2quTxt8pJS4xWNnXmSfPFG/RJ+rss6Rc6IHNP/23xB/64hzsWSSViMVxCT7zIU65kk9mbfihZko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=QWHlN5S1; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=plJo6EVo; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="QWHlN5S1";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="plJo6EVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751025694; x=1751630494;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=uKS3HDNF930knCZOok1v2ViZte0XlPRX5ok0p1B2NIA=;
	b=QWHlN5S1uJmIPI6qxF/CONzE/AY4TSvK8ygi5az3JJjoyLnpkvmq1Yenyb0VfvHP9VjaPUdl4gj/Z
	 cuB41kRZ/vKy0GQuJmWUVbZxBYms1la/ymoHS3dWdE/rQt3IhTVIfaixYc8PdE/j9+xyR/oNyIMwZA
	 fyh9H3+vid4KYIMOMHZCtvaQm8t/JVYisGmUUetIC7LcLHKUkRl3bcfpNiS09+QqyDVAUgP3yhgqzV
	 u1eSESmFSjR1cM3iDGQdzkeAOKsj7BtOnQSKuPwrY8S1bxZGinJ01D3SpvWZ1s7ubRYpZiCw7MFFjC
	 bplfF0f/u94x3nD9/zvTJw8p8ZGISXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751025694; x=1751630494;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=uKS3HDNF930knCZOok1v2ViZte0XlPRX5ok0p1B2NIA=;
	b=plJo6EVoYEQpR09rHvEkZH4M66P0Elt8wjAzuB0fq2Kjl/Dqn/VoRbn5bITykMt/76HQt+xL3Y33n
	 fi2q8+ZAQ==
X-HalOne-ID: 785ab324-534e-11f0-8646-e90f2b8e16ca
Received: from smtpclient.apple (c188-150-224-8.bredband.tele2.se [188.150.224.8])
	by mailrelay2.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 785ab324-534e-11f0-8646-e90f2b8e16ca;
	Fri, 27 Jun 2025 12:01:34 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH 2/4] mm/slub: allow to set node and align in k[v]realloc
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aF6DmPmeSpWU3hH_@pc636>
Date: Fri, 27 Jun 2025 14:01:23 +0200
Cc: Danilo Krummrich <dakr@kernel.org>,
 linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C6331389-1008-4D8B-99AA-C2640671E9A2@konsulko.se>
References: <20250627092901.356909-1-vitaly.wool@konsulko.se>
 <20250627093714.402989-1-vitaly.wool@konsulko.se> <aF51PTZh0gRVFuYu@pollux>
 <aF6DmPmeSpWU3hH_@pc636>
To: Uladzislau Rezki <urezki@gmail.com>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jun 27, 2025, at 1:42=E2=80=AFPM, Uladzislau Rezki =
<urezki@gmail.com> wrote:
>=20
> Hello, Vitaly, Danilo.
>=20
>> On Fri, Jun 27, 2025 at 11:37:14AM +0200, Vitaly Wool wrote:
>>> Reimplement k[v]realloc_node() to be able to set node and
>>> alignment should a user need to do so. In order to do that while
>>> retaining the maximal backward compatibility, the following rules
>>> are honored:
>>> * kmalloc/kzalloc/krealloc remain unchanged
>>> * kvmalloc/kvrealloc/kvcalloc remain unchanged
>>> * kvrealloc remains unchanged
>>> * kvrealloc_node is implemented as a new function taking align and
>>>  NUMA id as extra parameters compared to kvrealloc.
>>> * krealloc_node is implemented as a new function taking NUMA id
>>>  as an extra parameter compared to krealloc
>>> * kvmalloc_node/kvzalloc_node/kvcalloc_node get an extra parameter
>>>  (alignment)
>>=20
>> I see what you're doing here:
>>=20
>> You created vrealloc_node_noprof() in the previous patch, taking the =
following
>> arguments:
>>=20
>> vrealloc_node_noprof(const void *p, size_t size,
>>      unsigned long align,
>>      gfp_t flags, int nid)
>>=20
>> And now you're aligning the newly introduced krealloc_node() and
>> kvrealloc_node() with that.
>>=20
>> The idea for having an align argument on krealloc_node() simply is =
that it
>> fails if the alignment requirement can't be fulfilled by the =
corresponding
>> kmalloc bucket, such that we can fall back to vrealloc_node() in
>> kvrealloc_node().
>>=20
>> Generally, this makes sense to me.
>>=20
>> However, now you consequently have to add the align argument to =
kvmalloc_node(),
>> kvzalloc_node(), kvcalloc_node() as well.
>>=20
>> This is what creates this huge diffstat changing all the users.
>>=20
>> IMHO, the problem here was introduced already with =
vrealloc_node_noprof() taking
>> an align argument in your previous patch, since now you have to =
adjust
>> everything else to logically follow the same naming scheme.
>>=20
>> Instead, I think you should introduce vrealloc_node_align(),
>>=20
> I am probably missing something. Could you please clarify why do you
> need the vrealloc_node_align() and other friends? Do you have users
> which require vrealloc() or kvrealloc() to support nid and align from
> Rust API point of view?=20
>=20
>=20

Alignment for Rust allocators should generally be supported, it=E2=80=99s =
been listed as TODO for a while.
Node awareness is very desirable for e.g. KVBox and for the coming zpool =
mapping.

~Vitaly

