Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9964221F12
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751363150; cv=none; b=SOnbGUtTvgm9ZsYNKyxGEHjQ1X4EFZpFESqfyRN4O+1b119lr5oLjziTo3Bwx8xmT3lZB6T8totum9vLfGVQEsy5pzCpgXmv3e0Vrs5vs/8RbJlnWGZm7QHK4dnFb8BHxvogL/9FdQtY1jBjAdSgRN5y0d/CAI+xQ34Iqw6fI2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751363150; c=relaxed/simple;
	bh=ZKV49xrH1en0LN+o1bxz7jbN5/MlqIHiSsutGOWpoj4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LPksNCapob9L/jlbeHhq8n4VpQUI0Mev19OVUWSyW7GVTalbhINmNUSD50PUAUlvj1eT8lAYLWst20p6xMNRvISW3j7p4YiEarpVSFXldXRJ7stiHc1GZgKWfBHPCDIR+7zuSFe2eV4IyvuvEzXFgTCcupc+Jf4FhDUeL0gFovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=DU5BuadJ; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=jDp8C9ny; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="DU5BuadJ";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="jDp8C9ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751363144; x=1751967944;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=ZKV49xrH1en0LN+o1bxz7jbN5/MlqIHiSsutGOWpoj4=;
	b=DU5BuadJ8RYFEdu/uevam2G6DqQZQnnf7tFi5jbIkVmFHyh87z4UqCXHLZtEn8mJEQA0sg0BB0abD
	 +AGHpR1PHt390/AKC9kp2+SOe/DQLtVK2A8CqfFPUslOQbQzUiCc2iCWlQdINdKwGwqsui9RlEBOUn
	 d0cPz8ZlP5zlDMpSKDfy03fHszIiSnKVa4qzsBmJriag4ycrmQYOPhF7IfQSDkgPL9GQUWKvKXGpOf
	 5LW9Io81nXAzcxWxJonGeZlbgUhRMfq3viGftxXr9D0PJFQHw8bryyhaeGXGpT/c+LZyk73AeJu8IT
	 /XBLMS/MNgVyQXny/9YcEInQZcuTXAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751363144; x=1751967944;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=ZKV49xrH1en0LN+o1bxz7jbN5/MlqIHiSsutGOWpoj4=;
	b=jDp8C9nyUrGztV4nz223BpyGLbeqrMQor86FZHrvNtq1Onl3ZCiuOtWDgmvXZKZAho4OduZQLCSQ/
	 BGSsLAQCA==
X-HalOne-ID: 272f01c6-5660-11f0-8f4d-e90f2b8e16ca
Received: from smtpclient.apple (c188-150-224-8.bredband.tele2.se [188.150.224.8])
	by mailrelay2.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 272f01c6-5660-11f0-8f4d-e90f2b8e16ca;
	Tue, 01 Jul 2025 09:45:43 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v9 2/4] mm/slub: allow to set node and align in
 k[v]realloc
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <CAJ-ks9me9i-zkJcZerixEcyxQK764ubL9KQ22kM6B48du_fBig@mail.gmail.com>
Date: Tue, 1 Jul 2025 11:45:33 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Uladzislau Rezki <urezki@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5B3F6032-1971-439F-8A4B-344B6136A4A2@konsulko.se>
References: <20250630221511.3325123-1-vitaly.wool@konsulko.se>
 <20250630221628.3325244-1-vitaly.wool@konsulko.se>
 <CAJ-ks9me9i-zkJcZerixEcyxQK764ubL9KQ22kM6B48du_fBig@mail.gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jul 1, 2025, at 1:41=E2=80=AFAM, Tamir Duberstein =
<tamird@gmail.com> wrote:
>=20
> On Mon, Jun 30, 2025 at 6:16=E2=80=AFPM Vitaly Wool =
<vitaly.wool@konsulko.se> wrote:
>>=20
>> Reimplement k[v]realloc_node() to be able to set node and
>> alignment should a user need to do so. In order to do that while
>> retaining the maximal backward compatibility, add
>> k[v]realloc_node_align() functions and redefine the rest of API
>> using these new ones.
>>=20
>> With that change we also provide the ability for the Rust part of
>> the kernel to set node and aligmnent in its K[v]xxx
>> [re]allocations.
>>=20
>> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
>=20
> The typo (slub) snuck back in.

Bummer. ;)

Thanks for pointing that out. I=E2=80=99ll fix it in the anniversary =
patchset, hopefully this will be the only thing to fix.

~Vitaly=
