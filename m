Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226F7212B3D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053394; cv=none; b=sCz2MjvQrCKX7PvUVQd/0yQFtw1dEyMwKHyWXfD9nFYK1+Ac4Ad9PA5jZGuCnzSfcTE33HSKQLhqR/fcOhi9H89tDK3ZX3Zev65kt/Y0w0pWcczfEal9OCLRke8KDoO29pP3a4+291FiZC7/EaBCXa+iFRRRguAIkFkwyRPdqqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053394; c=relaxed/simple;
	bh=kip3maXOLhHraRuZCsgnHfHjSz1/RRGdLakbVWQIGCU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PUSbLGWvuYRQJkKvJ4hBg9BGv9g7wrSnUD43sNlsv+QQPe1AXTG0uZQ+TEsHTkcEBw0AZuVuTcT28FoYuwMHlvYwEvf6CAb+Lu433Oy1u+EkseF7tuomiTXKEfMpIxX+w8zXOIRW97GP9oM2fb+ImBRA2GxcOAGxP3xI6BTgpSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=nhKx0Tpw; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=hvVysKG+; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="nhKx0Tpw";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="hvVysKG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751053390; x=1751658190;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=kip3maXOLhHraRuZCsgnHfHjSz1/RRGdLakbVWQIGCU=;
	b=nhKx0TpwpR1Q4EEI1eKXo4iE+0w6MO6l1JqE9jkr7/k6K/5oyn5/HOiHpVJ42ACvYpzdP13OrMFxl
	 OQHDswdqs8bE2sNFOcGmdWiC/zrd5BdvyCGns5BjNHFeYEPzoZIVzeo+1UwnTKsiSEooZ66vxTDlcj
	 nXk7r2yTWWwEIHAHaKp1BFVXoXGRiZ6kWdbU68Zx2tVk9a75Zt5O7kN1Siq/PZTRURnU0p4iwBnYjm
	 iJtu7mkiWe/KYsu7A+AMXjv0+FGYJOzVWEr9W5ibbOaPeZDSixJ6aH34+vpbo46VhSRzNqatw0tBLn
	 3KlQbXocjuMmhJOtgyAnoNV/0JFBheg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751053390; x=1751658190;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=kip3maXOLhHraRuZCsgnHfHjSz1/RRGdLakbVWQIGCU=;
	b=hvVysKG+OEzQSEGEPSRVQhnvKz1kZm0qnr+5Uzn59+GV/cP5isf4RK2KeQslXaOtRr0T+a9Xtnyux
	 tI1oKScBA==
X-HalOne-ID: f34261ec-538e-11f0-a53b-85eb291bc831
Received: from smtpclient.apple (c188-150-224-8.bredband.tele2.se [188.150.224.8])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id f34261ec-538e-11f0-a53b-85eb291bc831;
	Fri, 27 Jun 2025 19:43:09 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v6 3/4] rust: add support for NUMA ids in allocations
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aF7km7nm9ggoj2AW@pollux>
Date: Fri, 27 Jun 2025 21:42:58 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Uladzislau Rezki <urezki@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EFAE3F9B-645F-4121-9B9A-7D7EE5B072ED@konsulko.se>
References: <20250627181505.2080916-1-vitaly.wool@konsulko.se>
 <20250627181638.2081102-1-vitaly.wool@konsulko.se> <aF7km7nm9ggoj2AW@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jun 27, 2025, at 8:36=E2=80=AFPM, Danilo Krummrich =
<dakr@kernel.org> wrote:
>=20
> On Fri, Jun 27, 2025 at 08:16:38PM +0200, Vitaly Wool wrote:
>> Add support for specifying NUMA ids in Rust allocators as an Option
>> (i. e. providing `None` as nid corresponds to NUMA_NO_NODE). To do
>> this, modify ReallocFunc to use the new extended realloc primitives
>> from the C side of the kernel (i. e. k[v]realloc_node/vrealloc_node)
>> and add the new function alloc_node to the Allocator trait while
>> keeping the existing one (alloc) for backward compatibility.
>>=20
>> This will allow to specify node to use for allocation of e. g.
>> {KV}Box, as well as for future NUMA aware users of the API.
>>=20
>> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
>=20
> Did you see [1]? I can't see the feedback being addressed.
>=20
> [1] https://lore.kernel.org/lkml/aF5-a-bUp1pD5tiS@pollux/

Awkwardly enough, this one I did miss.=20=
