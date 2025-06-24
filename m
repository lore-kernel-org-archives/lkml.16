Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC31425BF04
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768238; cv=none; b=AvBBpCJG04v4X1X8PLaRznJOiigb0Xm/KnGx79MW6yHCXxdCKwTwU6hm/5qnoefJD9XrKOAUQAkhEKlWdyHJPvwL7dv6/6GBTpBvec64Pp/PtPvRZN3+QCtu4IhlDEUQJnnUF0PCa2AMLCsVvCgYtaC90NipkUNL//JFi08w1uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768238; c=relaxed/simple;
	bh=vF01rZpDzoIVAbNSn6ZBGT9knYGRMdAWg5gganY2Yqw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=BCc2mP9CgrYaee9GaQY5UHKFQIOWTH9NkE7Q0kJ+94B9XlI+T4Xdk6BqqtcOfDcF5fv3sJ6CU8fCQEoxkwcbGq5TASMp44epSvtCAY8ItB4u3JlWPvUsCLnmNArmGxcNw7broX6lU6tiqEJwilsgkIBfKwA23D1EowiSBAQrkt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=bEZMufuy; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=KMf9weui; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="bEZMufuy";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="KMf9weui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750768228; x=1751373028;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=vF01rZpDzoIVAbNSn6ZBGT9knYGRMdAWg5gganY2Yqw=;
	b=bEZMufuyIIGNCIWWKFBUozLBZMWTIu5d/9fxAop4xVNAkIFFnYJk5LSnZ5dttQkOow7h8puVBwpew
	 llBwl01koWDkQoqgl7H5qW9ODJB291Qoop7KmvJSIM9d1TG+aXdBDtCbflYEsUVocQ1QfSHGbTpdeu
	 wWIVu6QUfp1Y/Qza7IS06YkS4Vz76yJLOmWbRs5PLDdBCZIALicNI30PbTfihchF6JnuWJLlRSmNLx
	 lYZ/AULZfKkrML2OLMLAV/yINSDnLUgXzLT9GVi0+kyTihwAWan1q5Yz0zb+xyqOXKlauT0DCzAhQm
	 dlRiAwDimIzPB6LCevuFDK7bAbp4tqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750768228; x=1751373028;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=vF01rZpDzoIVAbNSn6ZBGT9knYGRMdAWg5gganY2Yqw=;
	b=KMf9weui2bgcX+N3Hb2Kq30L3N98dx9I0MQuntmZfCYVCrR80rTBtPkTfOG+USTW9iy41m74K0l6I
	 4uNPealDg==
X-HalOne-ID: 0243cf4c-50f7-11f0-8442-f3c0f7fef5ee
Received: from smtpclient.apple (host-90-233-201-126.mobileonline.telia.com [90.233.201.126])
	by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 0243cf4c-50f7-11f0-8442-f3c0f7fef5ee;
	Tue, 24 Jun 2025 12:30:27 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH] mm/vmalloc: allow to set node and align in vrealloc
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aFqYWOZoOirYlUCy@pollux>
Date: Tue, 24 Jun 2025 14:30:17 +0200
Cc: Uladzislau Rezki <urezki@gmail.com>,
 linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <948A3530-4C1B-4D57-881A-6C003BF637ED@konsulko.se>
References: <20250624095121.3243540-1-vitaly.wool@konsulko.se>
 <aFqT1mK7SYsYd3DZ@pc636> <D562EE6A-DE99-4C97-8934-D60682DDE711@konsulko.se>
 <aFqYWOZoOirYlUCy@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jun 24, 2025, at 2:21=E2=80=AFPM, Danilo Krummrich =
<dakr@kernel.org> wrote:
>=20
> On Tue, Jun 24, 2025 at 02:15:01PM +0200, Vitaly Wool wrote:
>> There=E2=80=99s a patch pending inclusion of this one which will be =
the user of this change. I was reluctant
>> to combine these 2 in one series because the second one is on the =
Rust side, but it can be found
>> here: https://github.com/vwool/linux-mm/pull/new/realloc-extend.
>=20
> I think the link is broken, I suppose you wanted to refer to the patch =
in [1].
>=20
> [1] =
https://github.com/vwool/linux-mm/commit/5af47ac6f9010814263617b2136203a54=
ed4c25e
>=20

You=E2=80=99re right, thanks a lot!

~Vitaly=
