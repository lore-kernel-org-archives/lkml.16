Received: from sg-1-21.ptr.blmpb.com (sg-1-21.ptr.blmpb.com [118.26.132.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F7925E456
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744198730; cv=none; b=eWvDb/dyryLjcFFa8lDKZyB9huxEDvsWT62r6OiPT6vD27bD58yP79fX+uQJrsNfIvkf2QHn87Jn+HQnTFCkCgq+9GPJuz079a1RLtwIRRbpNmu+RO3LhwOja+z8dyX63N+h9+s1TXolyrti/WrjrYVGNMgEHXtQIFxjchTIrxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744198730; c=relaxed/simple;
	bh=Oe8aDUQAq4T02rUk+a7NU/+Tifl5LtSGzTZvSbTGRuU=;
	h=Message-Id:To:Subject:From:References:Content-Type:Date:Cc:
	 Mime-Version:In-Reply-To; b=G7J2uoGX0EPCStniHsSmbEAXcpLP1tLNPl+JRXIfgt2ZjfM3v386FxgxXNx6odfbHwGQp1ZZ/Q3J9XiuCtz9nlORK5qHfPB8PbxpTUaLcsALlANn1JJG/7zTz1HZuK0mMFpK3NAK3e/QCH9+RK3VwPz/CiFqpbB4gBJ/BgFix7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacemit.com; spf=pass smtp.mailfrom=spacemit.com; dkim=pass (2048-bit key) header.d=spacemit.com header.i=@spacemit.com header.b=rKkxpWV+; arc=none smtp.client-ip=118.26.132.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spacemit.com header.i=@spacemit.com header.b="rKkxpWV+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1744198718; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Oe8aDUQAq4T02rUk+a7NU/+Tifl5LtSGzTZvSbTGRuU=;
 b=rKkxpWV+4D0TrxLogpHta3M/JVPt7Cr7OYljS1tbl+Gz412K2g77vJZ2AhL3ZpYkWO1elf
 o2NrMXe1gpv90LVcffYr+IUGyGYIsJmRpUZknrAuJpeUsz8kV6teegpnDh4ubLFHEi3Kdm
 wcW7+X0nMxrkDzxgu+85UtbgIC1RiTTop2mLtsr9QeHdiRBfoymLuxoL0o8qI/ILkkWaGq
 VgUpN4PmEmXoVNStq941sVBQ6VZMmXVclMVijMRqW9Zhy5BhrZhiWif8jKFU0Id3wS5tKK
 Iq11FOZmcB1/yPkzRNzADNE0encJIQn7Kk/4AtRdpy/A+eaIeTNA+F6UdLyiAg==
Message-Id: <e65434ad476fc113aa6f8acea48f4579bf5fa27a.b2769c19.b098.4e58.9cf1.1eb975cc2227@feishu.cn>
To: "Ze Huang" <huangze@whut.edu.cn>
Subject: Re: [PATCH 5/7] phy: spacemit: add USB3 support for K1 PCIe/USB3 combo PHY
From: "Pan Junzhong" <junzhong.pan@spacemit.com>
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
	<20250407-b4-k1-usb3-v3-2-v1-5-bf0bcc41c9ba@whut.edu.cn>
X-Lms-Return-Path: <lba+167f65c3c+3cb14f+vger.kernel.org+junzhong.pan@spacemit.com>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Apr 2025 19:38:35 +0800
Cc: "Vinod Koul" <vkoul@kernel.org>, 
	"Kishon Vijay Abraham I" <kishon@kernel.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@gentoo.org>, 
	"Ze Huang" <huangze@whut.edu.cn>, 
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Thinh Nguyen" <Thinh.Nguyen@synopsys.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20250407-b4-k1-usb3-v3-2-v1-5-bf0bcc41c9ba@whut.edu.cn>
Content-Transfer-Encoding: base64

SGkgWmUsCgo+ICtzdGF0aWMgaW50IHNwYWNlbWl0X2NvbWJwaHlfaW5pdF91c2Ioc3RydWN0IHNw
YWNlbWl0X2NvbWJwaHlfcHJpdiAqcHJpdikKClRoZSBVU0IzIHBoeSBkcml2ZXIgaXMgdXBkYXRl
ZCBpbiB0aGUgdmVuZG9yJ3MgdHJlZS7CoApodHRwczovL2dpdGVlLmNvbS9iaWFuYnUtbGludXgv
bGludXgtNi42L2NvbW1pdC8xYzBiM2I0YjljNzdkMjJjYTg4NmM4YTRjNDRlNjJiNTg5MWY4YWJj
CgpZb3UgY2FuIHN1Ym1pdCB2MiB0b2dldGhlciB3aXRoIHRoZSBjaGFuZ2Ugb2YgbGZwc190aHJl
cyAod3JpdGVzIDB4NTggcmVnaXN0ZXIpCndpdGhvdXQgYWRkaW5nIG5ldyBwcm9wZXJ0aWVzIGZv
ciBkdCBub2RlLgoKQi5SLgoNCgpUaGlzIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50IGFyZSBj
b25maWRlbnRpYWwgYW5kIG1heSBiZSBwcml2aWxlZ2VkIG9yIG90aGVyd2lzZSBwcm90ZWN0ZWQg
ZnJvbSBkaXNjbG9zdXJlLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2Yg
dGhpcyBtZXNzYWdlLCBwbGVhc2UgZGVsZXRlIGl0IGFuZCBhbnkgYXR0YWNobWVudCBmcm9tIHlv
dXIgc3lzdGVtIGFuZCBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBieSByZXBseSBlLW1h
aWwuIFVuaW50ZW5kZWQgcmVjaXBpZW50cyBzaG91bGQgbm90IHVzZSwgY29weSwgZGlzY2xvc2Ug
b3IgdGFrZSBhbnkgYWN0aW9uIGJhc2VkIG9uIHRoaXMgbWVzc2FnZSBvciBhbnkgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgbWVzc2FnZS4gRW1haWxzIGNhbm5vdCBiZSBndWFyYW50ZWVk
IHRvIGJlIHNlY3VyZSBvciBlcnJvciBmcmVlIGFzIHRoZXkgY2FuIGJlIGludGVyY2VwdGVkLCBh
bWVuZGVkLCBsb3N0IG9yIGRlc3Ryb3llZCwgYW5kIHlvdSBzaG91bGQgdGFrZSBmdWxsIHJlc3Bv
bnNpYmlsaXR5IGZvciBzZWN1cml0eSBjaGVja2luZy4gCiAK5pys6YKu5Lu25Y+K5YW25Lu75L2V
6ZmE5Lu25YW35pyJ5L+d5a+G5oCn6LSo77yM5bm25Y+v6IO95Y+X5YW25LuW5L+d5oqk5oiW5LiN
5YWB6K646KKr5oqr6Zyy57uZ56ys5LiJ5pa544CC5aaC6ZiB5LiL6K+v5pS25Yiw5pys6YKu5Lu2
77yM5pWs6K+356uL5Y2z5Lul5Zue5aSN55S15a2Q6YKu5Lu255qE5pa55byP6YCa55+l5Y+R5Lu2
5Lq677yM5bm25bCG5pys6YKu5Lu25Y+K5YW25Lu75L2V6ZmE5Lu25LuO6ZiB5LiL57O757uf5Lit
5LqI5Lul5Yig6Zmk44CC5aaC6ZiB5LiL5bm26Z2e5pys6YKu5Lu25YaZ5piO5LmL5pS25Lu25Lq6
77yM5pWs6K+35YiH5Yu/5L2/55So44CB5aSN5Yi244CB5oqr6Zyy5pys6YKu5Lu25oiW5YW25Lu7
5L2V5YaF5a6577yM5Lqm6K+35YiH5Yu/5L6d5pys6YKu5Lu25oiW5YW25Lu75L2V5YaF5a656ICM
6YeH5Y+W5Lu75L2V6KGM5Yqo44CC55S15a2Q6YKu5Lu25peg5rOV5L+d6K+B5piv5LiA56eN5a6J
5YWo5ZKM5LiN5Lya5Ye6546w5Lu75L2V5beu6ZSZ55qE6YCa5L+h5pa55byP77yM5Y+v6IO95Lya
6KKr5oum5oiq44CB5L+u5pS544CB5Lii5aSx5oiW5o2f5Z2P77yM5pS25Lu25Lq66ZyA6Ieq6KGM
6LSf6LSj5YGa5aW95a6J5YWo5qOA5p+l44CC
