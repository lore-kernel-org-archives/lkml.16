Received: from mailrelay3-3.pub.mailoutpod3-cph3.one.com (mailrelay3-3.pub.mailoutpod3-cph3.one.com [46.30.212.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC9729DB6E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025483; cv=none; b=MGA/6IdyU99rQMHUF8lCrX6IoMFKZTKlox8OcTnBHmOUqJTllcsZ79DW5ufdmXAmvY9jIChzBR6I+CpVTUbUUOQTH+mt9sG22JUVw+XN05w2UBTXiI1KpPZRBwNzOfZR+BhQO48JLYPt3gPiSU7o/H3YaJQeqf6xw8LSgJKH2Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025483; c=relaxed/simple;
	bh=x220oYMoBsGPuXEgbq0U3KRk6gYISMp07KvZoM2PD10=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uROxDF/kvm9BbAxmI6Oh7BEcWAhCsBbFgryKBoavncfdgWBOknJmjdOCsYXa5wqOkzydGdr6gnDYG1XoFssExL6rOCu6No4VaryQr6+CL4qKZ9Gh2pnDYHi3EY4/uA+Nn35mh0Q2RC0pKjTin2OGsBmy2OosCBUO12hdV1RQe/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=qozhM4Hq; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=6iOIYct/; arc=none smtp.client-ip=46.30.212.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="qozhM4Hq";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="6iOIYct/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751025474; x=1751630274;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=4PdaIEcY8aBWgtkPAUuRbOlSr6D+EmVvejyVXqlJr0A=;
	b=qozhM4HqoHtcgGiyVg67H4L0GJDL/hBJSY+yhZ3T8EN60NwiCNmNZTDV+OiRkMVD8HUefDL8oYHuQ
	 w33LXv9DBkJHAtTeYsaz2svu6uUfSTuw0bpNAeu3cEF8zAhLAh0NdiWlhZ5HISBgn9d1pPzk80KUoq
	 kLWVIqi6FRK6p2mBUUHzVrNjbBW+mIet7WFSeltHJkvhzBGC4uMKIR4g1R3fnVK/SmPE7P8VIVTY4j
	 TtkWco3rlPhYNVBw/EWWpTMU3uV+JqhF7CdXDG9Ns3idD940GjWYP/T91bWaybJdj6rKRzgsfodulZ
	 t3YZu/7vN5LpKKZuR5XNO+pAFJWrQrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751025474; x=1751630274;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=4PdaIEcY8aBWgtkPAUuRbOlSr6D+EmVvejyVXqlJr0A=;
	b=6iOIYct/d6Dr+BZvwWUmRemw/Wzzw2zxdPveU4k7HRtox8G6GMw/yyZvUZARQZae+ZawMA0bUfFxx
	 lRoeRczCw==
X-HalOne-ID: f4a52dae-534d-11f0-9dd3-2b8368a4d5c5
Received: from smtpclient.apple (c188-150-224-8.bredband.tele2.se [188.150.224.8])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id f4a52dae-534d-11f0-9dd3-2b8368a4d5c5;
	Fri, 27 Jun 2025 11:57:53 +0000 (UTC)
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
In-Reply-To: <aF51PTZh0gRVFuYu@pollux>
Date: Fri, 27 Jun 2025 13:57:43 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Uladzislau Rezki <urezki@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8A2911F-B5D6-4323-9E37-776EFD6DB265@konsulko.se>
References: <20250627092901.356909-1-vitaly.wool@konsulko.se>
 <20250627093714.402989-1-vitaly.wool@konsulko.se> <aF51PTZh0gRVFuYu@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jun 27, 2025, at 12:41=E2=80=AFPM, Danilo Krummrich =
<dakr@kernel.org> wrote:
>=20
> On Fri, Jun 27, 2025 at 11:37:14AM +0200, Vitaly Wool wrote:
>> Reimplement k[v]realloc_node() to be able to set node and
>> alignment should a user need to do so. In order to do that while
>> retaining the maximal backward compatibility, the following rules
>> are honored:
>> * kmalloc/kzalloc/krealloc remain unchanged
>> * kvmalloc/kvrealloc/kvcalloc remain unchanged
>> * kvrealloc remains unchanged
>> * kvrealloc_node is implemented as a new function taking align and
>>  NUMA id as extra parameters compared to kvrealloc.
>> * krealloc_node is implemented as a new function taking NUMA id
>>  as an extra parameter compared to krealloc
>> * kvmalloc_node/kvzalloc_node/kvcalloc_node get an extra parameter
>>  (alignment)
>=20
> I see what you're doing here:
>=20
> You created vrealloc_node_noprof() in the previous patch, taking the =
following
> arguments:
>=20
> vrealloc_node_noprof(const void *p, size_t size,
>     unsigned long align,
>     gfp_t flags, int nid)
>=20
> And now you're aligning the newly introduced krealloc_node() and
> kvrealloc_node() with that.
>=20
> The idea for having an align argument on krealloc_node() simply is =
that it
> fails if the alignment requirement can't be fulfilled by the =
corresponding
> kmalloc bucket, such that we can fall back to vrealloc_node() in
> kvrealloc_node().
>=20
> Generally, this makes sense to me.
>=20
> However, now you consequently have to add the align argument to =
kvmalloc_node(),
> kvzalloc_node(), kvcalloc_node() as well.
>=20
> This is what creates this huge diffstat changing all the users.
>=20
> IMHO, the problem here was introduced already with =
vrealloc_node_noprof() taking
> an align argument in your previous patch, since now you have to adjust
> everything else to logically follow the same naming scheme.
>=20
> Instead, I think you should introduce vrealloc_node_align(),
> kvrealloc_node_align(), etc. This way no existing function signatures, =
such as
> kvmalloc_node() have to be changed and no users have to be adjusted.
>=20
>=20

Yep, that makes sense indeed.

~Vitaly

