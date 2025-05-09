Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC4512D758;
	Fri,  9 May 2025 01:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746755964; cv=none; b=QxHrIs6Ql3SEjvD2N68W5jGqHeawpxJmQON/YjQz3vEXe0C+jWx+VXIs2k5t/Hk9aOBZYCnaWts9BYEBCtGKsvrDRsiHoNRrvKyWPM4VGF9CY4Ugo1s15QTONlmDDaALHO6NnGxhSjO9hpf9cZNgVE/fpt8JPIBRuRQtfo3hhqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746755964; c=relaxed/simple;
	bh=osuC42Dwrv2df4r7kNlB1NVy515oimGVDFQx8xKLrm8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=CY+vHlN4Y+9vlbGICfD+N25qIrntSFx/Nvsl4mSNMG9G6GvkHwqfnmCR3EllknO+sXJ1Co7UESpVxQ/d9DdDu8t1NsfK1FwYWTxyrL/ZrrJa7a92gyPgR11hZv1BWWcqnT+gUB/4U56qCclyTwCrCBabZu3cOhIXUQhpiZG2I9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=lUKDgkep reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="lUKDgkep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=55PNgOcKj2H7fTf4hRgwZb8Ew5SPSaRTUmV47X0Ho0A=; b=l
	UKDgkep97B/9Unz+gncswaNSIeZ+Lh0gamZ2w9JJlrUfo70hmw63fXntBNO4gb3W
	/eFGKOx5QBt2tR8fy3czCtzSLOqcr8TzOfxpcqKpn5afVpsqhBbMSXboBReZ2ld7
	QjqW+a+m3Dng7rbhT7CVZI2eELaTKFpaPmbnlb0s4g=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-104 (Coremail) ; Fri, 9 May 2025 09:58:09 +0800 (CST)
Date: Fri, 9 May 2025 09:58:09 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org, hjc@rock-chips.com,
	mripard@kernel.org, neil.armstrong@linaro.org, knaerzche@gmail.com,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v4 0/7] Convert inno hdmi to drm bridge
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <nco27hnwykffzgirhocskltrkcds32tefkix23nfknf3e5m3zd@mkrrbw6kogsi>
References: <20250422070455.432666-1-andyshrk@163.com>
 <9503607.rMLUfLXkoz@diego>
 <nco27hnwykffzgirhocskltrkcds32tefkix23nfknf3e5m3zd@mkrrbw6kogsi>
X-NTES-SC: AL_Qu2fBPueukAj7yafYOkfmkcVgOw9UcO5v/Qk3oZXOJF8jC7pxyUYZFlTGWvs7PCDJim1nQiHezZt88JTXIVAZqUNMere4kRSvPWFUR2XLkygWQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1a07d69.1e47.196b2c3aa12.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:aCgvCgD335UxYR1opDYAAA--.2599W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBdIXmgdXGlOSwAEsQ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpIERtaXRyeSwKCiBUaGFua3MgZm9yIHlvdSByZXZpZXcuCgrlnKggMjAyNS0wNS0wNSAwMDox
NjozNe+8jCJEbWl0cnkgQmFyeXNoa292IiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0u
Y29tPiDlhpnpgZPvvJoKPk9uIFNhdCwgTWF5IDAzLCAyMDI1IGF0IDA0OjQyOjA0UE0gKzAyMDAs
IEhlaWtvIFN0w7xibmVyIHdyb3RlOgo+PiBBbSBEaWVuc3RhZywgMjIuIEFwcmlsIDIwMjUsIDA5
OjA0OjM5IE1pdHRlbGV1cm9ww6Rpc2NoZSBTb21tZXJ6ZWl0IHNjaHJpZWIgQW5keSBZYW46Cj4+
ID4gRnJvbTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiA+IAo+PiA+IFdo
ZW4gcHJlcGFyaW5nIHRvIGNvbnZlcnQgdGhlIGN1cnJlbnQgaW5ubyBoZG1pIGRyaXZlciBpbnRv
IGEKPj4gPiBicmlkZ2UgZHJpdmVyLCBJIGZvdW5kIHRoYXQgdGhlcmUgYXJlIHNldmVyYWwgaXNz
dWVzIGN1cnJlbnRseQo+PiA+IGV4aXN0aW5nIHdpdGggaXQ6Cj4+ID4gCj4+ID4gMS4gV2hlbiB0
aGUgc3lzdGVtIHN0YXJ0cyB1cCwgdGhlIGZpcnN0IHRpbWUgaXQgcmVhZHMgdGhlIEVESUQsIGl0
Cj4+ID4gICAgd2lsbCBmYWlsLiBUaGlzIGlzIGJlY2F1c2UgUkszMDM2IEhETUkgRERDIGJ1cyBy
ZXF1aXJlcyBpdCdzIFBIWSdzCj4+ID4gICAgcmVmZXJlbmNlIGNsb2NrIHRvIGJlIGVuYWJsZWQg
Zmlyc3QgYmVmb3JlIG5vcm1hbCBEREMgY29tbXVuaWNhdGlvbgo+PiA+ICAgIGNhbiBiZSBjYXJy
aWVkIG91dC4KPj4gPiAKPj4gPiAyLiBUaGUgc2lnbmFsIGlzIHVuc3RhYmxlLiBXaGVuIHJ1bm5p
bmcgdGhlIGdsbWFyazIgdGVzdCBvbiB0aGUgc2NyZWVuLAo+PiA+ICAgIHRoZXJlIGlzIGEgc21h
bGwgcHJvYmFiaWxpdHkgb2Ygc2VlaW5nIHNvbWUgc2NyZWVuIGZsaWNrZXJpbmcuCj4+ID4gICAg
VGhpcyBpcyBiZWNhdXNlIFRoZSBIU1lOQy9WU1lOQyBwb2xhcml0eSBvZiByazMwMzYgSERNSSBh
cmUgY29udHJvbGxlZAo+PiA+ICAgIGJ5IEdSRi4gVGhpcyBwYXJ0IGlzIG1pc3NpbmcgaW4gdGhl
IGN1cnJlbnQgZHJpdmVyLgo+PiA+IAo+PiA+IFBBVENIIDF+NiBhcmUgdHJ5IHRvIEZpeCBEb2N1
bWVudCBpbiB0aGUgZHQtYmluZGluZywgdGhlbiBhZGQgdGhlCj4+ID4gbWlzc2luZyBwYXJ0IGlu
IGRyaXZlciBhbmQgZHRzLgo+PiA+IFBBVENIIDcgY29udmVydHMgdGhlIGN1cnJlbiBkcml2ZXIg
dG8gZHJtIGJyaWRnZSBtb2RlLgo+PiAKPj4gQWZ0ZXIgcmVzdXJyZWN0aW5nIG15IHJrMzAzNi1r
eWxpbiB3aGljaCBoYXNuJ3Qgc3VjZXNzZnVsbHkgYm9vdGVkIGluIGEKPj4gd2hpbGUsIEkgY291
bGQgdmVyeWlmeSB0aGlzIHNlcmllcywgc28gb24gYSByazMwMzYta3lsaW4KPj4gCj4+IFRlc3Rl
ZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPj4gCj4+IAo+PiBJJ2xsIHBy
b2JhYmx5IGFwcGx5IHBhdGNoZXMgMS00IHRvIGRybS1taXNjIGxhdGVyIHRvZGF5LCBhcyB0aGF0
IHNvbGVseQo+PiB0b3VjaGVzIHRoZSBSb2NrY2hpcCAoYW5kIG9ubHkgcmszMDM2LSlzaWRlIGFu
ZCBwYXRjaGVzIDUrNiB0byB0aGUKPj4gcm9ja2NoaXAgdHJlZS4KPj4gCj4+IFBhdGNoIDcgc2hv
dWxkIHByb2JhYmx5IGdldCBzb21lIGF0dGVudGlvbiBieSBwZW9wbGUgbW9yZSBmYW1pbGlhciB3
aXRoCj4+IGRybS1icmlkZ2VzLCBzbyBJJ2xsIGxldCB0aGF0IHNpdCBmb3IgYSBiaXQgbG9uZ2Vy
Lgo+Cj5JIHdpbGwgdGFrZSBhIGxvb2sgbGF0ZXIsIGJ1dCBvbiB0aGUgZmlyc3QgZ2xhbmNlIGl0
IGxvb2tzIGxpa2UgdGhlcmUKPmFyZSB0b28gbWFueSB0aGluZ3MgZ29pbmcgb24gaW4gdGhhdCBw
YXRjaCwgaW5jbHVkaW5nIHNvbWUgdW5uZWNlc3NhcnkKPmZuY3Rpb24gbW92ZW1lbnRzIGFuZCBk
ZWZpbmUgbW92ZW1lbnRzLCBldGMuIEkgd291bGQga2luZGx5IGFzayB0byBzcGxpdAoKVGhlc2Ug
cmVnaXN0ZXJzIHdlcmUgaW5pdGlhbGx5IGRlZmluZWQgaW4gYSBzZXBhcmF0ZSBoZWFkZXIgZmls
ZShpbm5vX2hkbWkuaCksIApidXQgdGhleSB3ZXJlIG9ubHkgdXNlZCBieSBhIHNpbmdsZSBDIGZp
bGUsIHNvIEkgdGhpbmsgaXQncyBub3QgbmVjZXNzYXJ5IHRvIHB1dAp0aGVtIGluIGEgc2VwYXJh
dGUgaGVhZGVyIGZpbGUuIEkgZGVjaWRlZCB0byBzaW1wbHkgbWVyZ2UgdGhlbSBpbnRvIHRoZSBp
bm5vX2hkbWkuYyBmaWxlLiAKSWYgSSBmaXJzdCBjcmVhdGUgYSBwYXRjaCBhbmQgc2VwYXJhdGVs
eSBjYXJyeSBvdXQgdGhlIG1lcmdpbmcgb2YgdGhpcyByZWdpc3RlciBkZWZpbml0aW9uLCB3b3Vs
ZCB0aGF0IGJlIHBvc3NpYmxlPwoKQW5kIEkgd2lsbCB0cnkgdG8gYXZvaWQgZnVuY3Rpb24gbW92
ZW1lbnRzIGluIG5leHQgdmVyc2lvbi4KCgo+dGhlIG5vbi1mdW5jdGlvbmFsIHJlZmFjdG9yaW5n
cyBhbmQgdGhlIGZ1bmN0aW9uYWwgb25lcyAoc3BsaXR0aW5nIHRvIGEKPmxpYnJhcnksIGV0Yyku
CgpXaWxsIGRvIGluIG5leHQgdmVyc2lvbi4KCj4KPj4gCj4+IAo+PiBUaGFua3MgYSBsb3QgZm9y
IHdvcmtpbmcgb24gYWxsIHRoaXMKPj4gSGVpa28KPj4gCj4+IAo+Cj4tLSAKPldpdGggYmVzdCB3
aXNoZXMKPkRtaXRyeQo=
