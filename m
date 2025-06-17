Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3316028C877;
	Tue, 17 Jun 2025 20:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750193954; cv=none; b=UL+xrD4KSfAOmv0rSI1FSa3obcBt+Al7vOx0SID4ydixKq9txFmnbwAXc0QX24RJ4GNTyhQ1u6xJBDcw61AoscT18Wiip0eIK1hpc0X+gp7UDSTr2Mjo60d9T3oioPK40D6CIj90q9YRFPW0ev1Fy7UiW9mza3h7Ur13rcK7ZQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750193954; c=relaxed/simple;
	bh=RgrsISeJz5JwdvIh9PDyYOFzsJuf10v2V3C+ejHvCfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0R+r5l40ni0EQ35Lmq59w0JNAmRjJyCGGC4GgomznQwQvXV8AUbIZAvT/hXhhmQKcrLSGsMq4q1rQ1qR/feyVGKAeFW1mCzvd/QuVKOsi5//bUz95jZ3KAY9s+yFxRtOJFnFZl6WVgrnjqwcSpnFQCb1bEpSryB6kkrwhqntAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bkkPQr91; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bkkPQr91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750193936; x=1750798736; i=w_armin@gmx.de;
	bh=RgrsISeJz5JwdvIh9PDyYOFzsJuf10v2V3C+ejHvCfc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bkkPQr916M3LW7n4cKqzfasMCJhDsEtutLFAZS04CitSNec6Tp2rEbam8Q42A82i
	 2SmM2UV2DTaDmaPDToi7UfTd9gEP06zH8fDknpC3DvDcvndsyAitiRUUfXTdFhqSG
	 YJB3JUqXZCmTw57VehDRItsbaQRChbgkbbokLl50DHy2KemeAHy+/W4zF3lF1NHWC
	 maTS+eLpzvWTqR7giWz94zfC2NwFXzo0t5s1qlrPZgYPG4NUvpMKM4oyaroNNv5AZ
	 /x5oCKjcO1I3QjuZ0iV0O7YH1UVyMvFnpXHqV0lCAPuIwMeFKTeCRHWbXagIMVizM
	 LbLgQlvclvt1g+J5aw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MowGa-1v8xpu21eQ-00nzAO; Tue, 17
 Jun 2025 22:58:56 +0200
Message-ID: <5b4f683a-e512-4633-a2a3-e0eb9789bf66@gmx.de>
Date: Tue, 17 Jun 2025 22:58:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] platform/x86: Add Uniwill WMI driver
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-2-W_Armin@gmx.de>
 <78c3f757-0ca9-4017-9360-4f97e0086c5d@oracle.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <78c3f757-0ca9-4017-9360-4f97e0086c5d@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:ay0mWEkruz1D/Rh8N0Q/5sAryZ+GUQw4TZYTmFzw2cNdKjLmP/N
 1J3sc5KOHW6LYTbybFOiGTLtRpp8bJEUtWWJsLZj0a3dqHQWx9aneEQSN8JV1V8ylGT4O8D
 tGQotUhm4doMLE3E1ENo6ZvSsxdyua3RJDbHChZqFxJmWo/n6EhJviiMl6KUtwzXttqKKVv
 VPvZu3VJBICwvqg4SB/qw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VF+qT+uJ79w=;8GEXYIWfVu1u0ujI6y80zsekvfj
 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
 MX9482UNmLk10qrj3Kubw+R1oOMNpGpP9wDE9oKnGTrKs45QEpGSPo9B8R+vSl/98BpAH96DU
 2k5ojHgxDnzcENFlV5dD6hMzPvm/H4scs/+XzuU1W6ychtfz1NXBK6Eoe6nmvlt/ybfy9bpcB
 BW/b8YPJgXpjATVUBlLDj5YGzZLsaIJC2eLXB4b7zV7vPdK2qdRwGK5mKuv32j5ofkyX/1sFB
 4H/vtSspPIyFoXOYByyYjWseyAaDfT7L9dwOmNG2232MJjqfeBitZc/Fr4/yawdIRN5wI/57H
 F3zkoq1VuqbtMGQ0SCdEqX1wBXFuZXqPBTGPB2QXsFpdBD8WE7RVIWTVE00n58/BD2MBY/1s4
 dhN7mHs6TYimZi/cyjeE2PwLzZ7ra6KCYefWYYUt39+w1FZPWWK48SOEnhC5CFzLDRKceISAw
 2JCghgUTe3iUc8UpnMZyWrPIsaHAkn5bcvGS5MdQ4X1Wwt0N5D7frCWxcZ9iWMU08YBfMvdUi
 qaE51PGVkpVydDTgbHzVFVKRsoxIyPo6qqC1qY2Vfi2XB+ujFRTlj88THPDRpiIUKUZNVdAHD
 Q/K4M/fxtthyIjBfnb/utd4cDYB+BttKkVo7GXsQ7w4AKbaug5sT1+KABFILatlEfUCSWplEu
 1SN5QKNx2peMXFwZ1b16p/prb09QTYjyY5tVfo9NDzKzRgPU3ZPoYMuy1Zrd0fzovAZD7UBl8
 9a1HaFT4P8MEptCGBu4pt4web19mQqbW/RQyFB2Y0LUtZbg5QjuY9Cr3ErcBROAZmwFk=

QW0gMTUuMDYuMjUgdW0gMjE6MDUgc2NocmllYiBBTE9LIFRJV0FSSToNCg0KPg0KPg0KPiBPbiAx
NS0wNi0yMDI1IDIzOjI5LCBBcm1pbiBXb2xmIHdyb3RlOg0KPj4gKyNkZWZpbmUgVU5JV0lMTF9P
U0RfU0lMRU5UX01PREVfT04gMHgwNg0KPj4gKyNkZWZpbmUgVU5JV0lMTF9PU0RfU0lMRU5UX01P
REVfT0ZGwqDCoMKgwqDCoMKgwqAgMHgwNw0KPj4gKw0KPj4gKyNkZWZpbmUgVU5JV0lMTF9PU0Rf
V0xBTl9PTsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwOA0KPj4gKyNkZWZpbmUgVU5JV0lMTF9P
U0RfV0xBTl9PRkbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MDkNCj4+ICsNCj4+ICsjZGVmaW5l
IFVOSVdJTExfT1NEX1dJTUFYX09OwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDBBDQo+PiArI2Rl
ZmluZSBVTklXSUxMX09TRF9XSU1BWF9PRkbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MEINCj4+
ICsNCj4+ICsjZGVmaW5lIFVOSVdJTExfT1NEX0JMVUVUT09USF9PTsKgwqDCoMKgwqDCoMKgIDB4
MEMNCj4+ICsjZGVmaW5lIFVOSVdJTExfS0VZX0JMVUVUT09USF9PRkbCoMKgwqDCoMKgwqDCoCAw
eDBEDQo+DQo+IHdoeSB0aGlzIGlzIFVOSVdJTExfS0VZX0JMVUVUT09USF9PRkYNCj4gbm90IFVO
SVdJTExfT1NEX0JMVUVUT09USF9PRkYgdHlwbyA/DQoNCkdvb2QgY2F0Y2gsIHRoaXMgc2hvdWxk
IGluZGVlZCBoYXZlIGJlZW4gVU5JV0lMTF9PU0RfQkxVRVRPT1RIX09GRi4NCg0KVGhhbmtzLA0K
QXJtaW4gV29sZg0KDQo+DQo+PiArDQo+PiArI2RlZmluZSBVTklXSUxMX09TRF9SRl9PTsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgMHgwRQ0KPj4gKyNkZWZpbmUgVU5JV0lMTF9PU0RfUkZfT0ZGwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAweDBGDQo+PiArDQo+PiArI2RlZmluZSBVTklXSUxMX09TRF8z
R19PTsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxMA0KPj4gKyNkZWZpbmUgVU5JV0lMTF9PU0Rf
M0dfT0ZGwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDExDQo+PiArDQo+PiArI2RlZmluZSBVTklX
SUxMX09TRF9XRUJDQU1fT07CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTINCj4+ICsjZGVmaW5l
IFVOSVdJTExfT1NEX1dFQkNBTV9PRkbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTMNCj4NCj4N
Cj4gVGhhbmtzLA0KPiBBbG9rDQo=
