Received: from email.devuan.org (polpo.devuan.org [65.21.79.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C8E1E32D3
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 22:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.79.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746914658; cv=none; b=uLZLQ0lmlEXvBywycNWZl2ee4vETC/wKX7gkO0N2k208Rr8b4MwKM6A8IkptAYduIaApVyGIO+sNyH5GETftl2dJJ4AfrJW/gTz+qRn8xo3xUojwih59dm2C9q32sgKNUh0yRrNdjnLlk/eck2fojC7FGBZql340ny0dKdYCLOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746914658; c=relaxed/simple;
	bh=cjSNKgGFeWQHhFdI5nd+HUT/Iy2Ac2dI8y0lB2faJus=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E0mzH+jwUkscgFEoIHYuL0aWcd2vTxRToQlH6/mIMan8RnVwNQ9vJn9clYhA0zgAt8qIg4cmw3GhPWH4HidvU+EbSuqJlk5oj3EbGftlB4yhuSXzqJSnxbYQ+88d9RtzCin0aGil8NoAwHJdpoExZTX+1Tueb+/pjJ51OEo7hb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=devuan.org; spf=pass smtp.mailfrom=devuan.org; dkim=pass (2048-bit key) header.d=devuan.org header.i=@devuan.org header.b=jwbFzQ1q; dkim=pass (2048-bit key) header.d=devuan.org header.i=@devuan.org header.b=nJDy1TJM; arc=none smtp.client-ip=65.21.79.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=devuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=devuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=devuan.org header.i=@devuan.org header.b="jwbFzQ1q";
	dkim=pass (2048-bit key) header.d=devuan.org header.i=@devuan.org header.b="nJDy1TJM"
Received: by email.devuan.org (Postfix, from userid 109)
	id 022FB658; Sat, 10 May 2025 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=devuan.org;
	s=default; t=1746914643;
	bh=cjSNKgGFeWQHhFdI5nd+HUT/Iy2Ac2dI8y0lB2faJus=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jwbFzQ1qRRd9BeNs4fxG6qfuGo1pvfeCbgGyYek4Y0WK0S77ZrINoxDP2wPdcdO6p
	 xFJ2DNf9m3dbXj5vqdc3HzPmrqXdrdi72gRyCWTwjQp9Lw5Xmxdm8uSCPOBqFukodB
	 Nuw4MhQ85axmvoPi8w7yX11ah3iItv7ql1kX196DNStqGo6nfmKsBA5U+hws7hsxgD
	 yvWlAa45h6NSAbXgIrdqzsq/5QUB6WTencIEQicvk7ZfPOH9XrUsXwTTfrzznibkMS
	 HC9NU5LK7jhaeenlSJXQbsTCQB0snPyMuDMBzJjq8G3K4glraHCLnDHPzdGblSWLw+
	 YGIEf03TqylqA==
X-Spam-Level: 
Received: from [10.14.5.250] (office.ipacct.com [195.85.215.8])
	by email.devuan.org (Postfix) with ESMTPSA id 844324E;
	Sat, 10 May 2025 22:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=devuan.org;
	s=default; t=1746914640;
	bh=cjSNKgGFeWQHhFdI5nd+HUT/Iy2Ac2dI8y0lB2faJus=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nJDy1TJM3BPZ7wnULPGwT2jorpQoslJrkY0pMciGANnwK5CI/4EhojOXGPu4FkfnQ
	 l5uLUs+edrQQbej7muEIN2/SGmOnsST6tcfZNQj49HOkeMetDk0c5AWzdxgVvdIo9c
	 cYvc137o6EeeshxE+djJHUsdFWs0sKCIB4W9uF6Ij8msEBrLLz+3WjZtNHSRuShQcP
	 ko3xFa8hI06gvFbcjjTh2d/dTmoZCnEORHB+0PDAwIH0na55gvo6xtPwDy8AEQMgRH
	 XJHGK7WMhFnfnWpVA1Iq2Mq49L3EZc4AAcphGbkXAz7V15xiwB9QakE2gd84MOM3pq
	 v1jVD9KWqQhsg==
Message-ID: <d113c621664bdfefee95fee5f17fb00c593d7f66.camel@devuan.org>
Subject: Re: Bug 220102 - struct taskstats breaks backward compatibility
 since version 15
From: Boian Bonev <bbonev@devuan.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>, Yang
 Yang <yang.yang29@zte.com.cn>, Wang Yaxin <wang.yaxin@zte.com.cn>, Kun
 Jiang <jiang.kun2@zte.com.cn>, xu xin <xu.xin16@zte.com.cn>
Date: Sun, 11 May 2025 01:03:58 +0300
In-Reply-To: <20250510132316.3719945330c9d0ebed86f8c9@linux-foundation.org>
References: <5c176101cd5fd8e629b18380bf7678ea6c6a5d63.camel@devuan.org>
	 <20250509141727.19b616d1c4a549d01656e5dd@linux-foundation.org>
	 <d48f4302ac09d9539242a324ec4d0917fede6a71.camel@devuan.org>
	 <20250510132316.3719945330c9d0ebed86f8c9@linux-foundation.org>
Content-Type: multipart/mixed; boundary="=-bjdRn8/vwfBVtMMUeEIq"
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--=-bjdRn8/vwfBVtMMUeEIq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2025-05-10 at 13:23 -0700, Andrew Morton wrote:
> > > > https://bugzilla.kernel.org/show_bug.cgi?id=3D220102
> >=20
> > My patch was attached in the bugzilla above.
>=20
> We barely use bugzilla at all for kernel development.=C2=A0 I think I wis=
h
> that kernel bugzilla was simply shut down, replaced with a page to
> help people to email their bug reports.

I am not sure if my patch is up to standards, PFA

>=20
> > I also see that Wang Yaxin
> > <wang.yaxin@zte.com.cn> has already sent a different but working
> > patch...
>=20
> Cool.=C2=A0 Except I cannot find that patch.=C2=A0 Help?

That one was on email.

--=-bjdRn8/vwfBVtMMUeEIq
Content-Disposition: attachment; filename="taskstats_compat.patch"
Content-Type: text/x-patch; name="taskstats_compat.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC90YXNrc3RhdHMuaCBiL2luY2x1ZGUvdWFw
aS9saW51eC90YXNrc3RhdHMuaAppbmRleCA5NTc2MjIzMmUwMTguLjdmMTY5YzY1YjE2ZSAxMDA2
NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3Rhc2tzdGF0cy5oCisrKyBiL2luY2x1ZGUvdWFw
aS9saW51eC90YXNrc3RhdHMuaApAQCAtMzQsNyArMzQsNyBAQAogICovCiAKIAotI2RlZmluZSBU
QVNLU1RBVFNfVkVSU0lPTgkxNQorI2RlZmluZSBUQVNLU1RBVFNfVkVSU0lPTgkxNgogI2RlZmlu
ZSBUU19DT01NX0xFTgkJMzIJLyogc2hvdWxkIGJlID49IFRBU0tfQ09NTV9MRU4KIAkJCQkJICog
aW4gbGludXgvc2NoZWQuaCAqLwogCkBAIC03Miw4ICs3Miw2IEBAIHN0cnVjdCB0YXNrc3RhdHMg
ewogCSAqLwogCV9fdTY0CWNwdV9jb3VudCBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKDgpKSk7CiAJ
X191NjQJY3B1X2RlbGF5X3RvdGFsOwotCV9fdTY0CWNwdV9kZWxheV9tYXg7Ci0JX191NjQJY3B1
X2RlbGF5X21pbjsKIAogCS8qIEZvbGxvd2luZyBmb3VyIGZpZWxkcyBhdG9taWNhbGx5IHVwZGF0
ZWQgdXNpbmcgdGFzay0+ZGVsYXlzLT5sb2NrICovCiAKQEAgLTgyLDE0ICs4MCwxMCBAQCBzdHJ1
Y3QgdGFza3N0YXRzIHsKIAkgKi8KIAlfX3U2NAlibGtpb19jb3VudDsKIAlfX3U2NAlibGtpb19k
ZWxheV90b3RhbDsKLQlfX3U2NAlibGtpb19kZWxheV9tYXg7Ci0JX191NjQJYmxraW9fZGVsYXlf
bWluOwogCiAJLyogRGVsYXkgd2FpdGluZyBmb3IgcGFnZSBmYXVsdCBJL08gKHN3YXAgaW4gb25s
eSkgKi8KIAlfX3U2NAlzd2FwaW5fY291bnQ7CiAJX191NjQJc3dhcGluX2RlbGF5X3RvdGFsOwot
CV9fdTY0CXN3YXBpbl9kZWxheV9tYXg7Ci0JX191NjQJc3dhcGluX2RlbGF5X21pbjsKIAogCS8q
IGNwdSAid2FsbC1jbG9jayIgcnVubmluZyB0aW1lCiAJICogT24gc29tZSBhcmNoaXRlY3R1cmVz
LCB2YWx1ZSB3aWxsIGFkanVzdCBmb3IgY3B1IHRpbWUgc3RvbGVuCkBAIC0xNjEsOCArMTU1LDgg
QEAgc3RydWN0IHRhc2tzdGF0cyB7CiAJX191NjQJd3JpdGVfYnl0ZXM7CQkvKiBieXRlcyBvZiB3
cml0ZSBJL08gKi8KIAlfX3U2NAljYW5jZWxsZWRfd3JpdGVfYnl0ZXM7CS8qIGJ5dGVzIG9mIGNh
bmNlbGxlZCB3cml0ZSBJL08gKi8KIAotCV9fdTY0ICBudmNzdzsJCQkvKiB2b2x1bnRhcnlfY3R4
dF9zd2l0Y2hlcyAqLwotCV9fdTY0ICBuaXZjc3c7CQkJLyogbm9udm9sdW50YXJ5X2N0eHRfc3dp
dGNoZXMgKi8KKwlfX3U2NCAgIG52Y3N3OwkJCS8qIHZvbHVudGFyeV9jdHh0X3N3aXRjaGVzICov
CisJX191NjQgICBuaXZjc3c7CQkJLyogbm9udm9sdW50YXJ5X2N0eHRfc3dpdGNoZXMgKi8KIAog
CS8qIHRpbWUgYWNjb3VudGluZyBmb3IgU01UIG1hY2hpbmVzICovCiAJX191NjQJYWNfdXRpbWVz
Y2FsZWQ7CQkvKiB1dGltZSBzY2FsZWQgb24gZnJlcXVlbmN5IGV0YyAqLwpAQCAtMTcyLDE0ICsx
NjYsMTAgQEAgc3RydWN0IHRhc2tzdGF0cyB7CiAJLyogRGVsYXkgd2FpdGluZyBmb3IgbWVtb3J5
IHJlY2xhaW0gKi8KIAlfX3U2NAlmcmVlcGFnZXNfY291bnQ7CiAJX191NjQJZnJlZXBhZ2VzX2Rl
bGF5X3RvdGFsOwotCV9fdTY0CWZyZWVwYWdlc19kZWxheV9tYXg7Ci0JX191NjQJZnJlZXBhZ2Vz
X2RlbGF5X21pbjsKIAogCS8qIERlbGF5IHdhaXRpbmcgZm9yIHRocmFzaGluZyBwYWdlICovCiAJ
X191NjQJdGhyYXNoaW5nX2NvdW50OwogCV9fdTY0CXRocmFzaGluZ19kZWxheV90b3RhbDsKLQlf
X3U2NAl0aHJhc2hpbmdfZGVsYXlfbWF4OwotCV9fdTY0CXRocmFzaGluZ19kZWxheV9taW47CiAK
IAkvKiB2MTA6IDY0LWJpdCBidGltZSB0byBhdm9pZCBvdmVyZmxvdyAqLwogCV9fdTY0CWFjX2J0
aW1lNjQ7CQkvKiA2NC1iaXQgYmVnaW4gdGltZSAqLwpAQCAtMTg3LDggKzE3Nyw2IEBAIHN0cnVj
dCB0YXNrc3RhdHMgewogCS8qIHYxMTogRGVsYXkgd2FpdGluZyBmb3IgbWVtb3J5IGNvbXBhY3Qg
Ki8KIAlfX3U2NAljb21wYWN0X2NvdW50OwogCV9fdTY0CWNvbXBhY3RfZGVsYXlfdG90YWw7Ci0J
X191NjQJY29tcGFjdF9kZWxheV9tYXg7Ci0JX191NjQJY29tcGFjdF9kZWxheV9taW47CiAKIAkv
KiB2MTIgYmVnaW4gKi8KIAlfX3UzMiAgIGFjX3RnaWQ7CS8qIHRocmVhZCBncm91cCBJRCAqLwpA
QCAtMjA4LDE3ICsxOTYsMzAgQEAgc3RydWN0IHRhc2tzdGF0cyB7CiAJLyogdjEyIGVuZCAqLwog
CiAJLyogdjEzOiBEZWxheSB3YWl0aW5nIGZvciB3cml0ZS1wcm90ZWN0IGNvcHkgKi8KLQlfX3U2
NCAgICB3cGNvcHlfY291bnQ7Ci0JX191NjQgICAgd3Bjb3B5X2RlbGF5X3RvdGFsOwotCV9fdTY0
ICAgIHdwY29weV9kZWxheV9tYXg7Ci0JX191NjQgICAgd3Bjb3B5X2RlbGF5X21pbjsKKwlfX3U2
NCAgIHdwY29weV9jb3VudDsKKwlfX3U2NCAgIHdwY29weV9kZWxheV90b3RhbDsKIAogCS8qIHYx
NDogRGVsYXkgd2FpdGluZyBmb3IgSVJRL1NPRlRJUlEgKi8KLQlfX3U2NCAgICBpcnFfY291bnQ7
Ci0JX191NjQgICAgaXJxX2RlbGF5X3RvdGFsOwotCV9fdTY0ICAgIGlycV9kZWxheV9tYXg7Ci0J
X191NjQgICAgaXJxX2RlbGF5X21pbjsKLQkvKiB2MTU6IGFkZCBEZWxheSBtYXggKi8KKwlfX3U2
NCAgIGlycV9jb3VudDsKKwlfX3U2NCAgIGlycV9kZWxheV90b3RhbDsKKwkvKiB2MTU6IGJyb2tl
biBjb21wYXRpYmlsaXR5ICovCisJLyogdjE2OiBhZGQgRGVsYXkgbWluL21heCAqLworCV9fdTY0
CWNwdV9kZWxheV9taW47CisJX191NjQJY3B1X2RlbGF5X21heDsKKwlfX3U2NAlibGtpb19kZWxh
eV9taW47CisJX191NjQJYmxraW9fZGVsYXlfbWF4OworCV9fdTY0CXN3YXBpbl9kZWxheV9taW47
CisJX191NjQJc3dhcGluX2RlbGF5X21heDsKKwlfX3U2NAlmcmVlcGFnZXNfZGVsYXlfbWluOwor
CV9fdTY0CWZyZWVwYWdlc19kZWxheV9tYXg7CisJX191NjQJdGhyYXNoaW5nX2RlbGF5X21pbjsK
KwlfX3U2NAl0aHJhc2hpbmdfZGVsYXlfbWF4OworCV9fdTY0CWNvbXBhY3RfZGVsYXlfbWluOwor
CV9fdTY0CWNvbXBhY3RfZGVsYXlfbWF4OworCV9fdTY0ICAgd3Bjb3B5X2RlbGF5X21pbjsKKwlf
X3U2NCAgIHdwY29weV9kZWxheV9tYXg7CisJX191NjQgICBpcnFfZGVsYXlfbWluOworCV9fdTY0
ICAgaXJxX2RlbGF5X21heDsKIH07CiAKIAo=


--=-bjdRn8/vwfBVtMMUeEIq--
