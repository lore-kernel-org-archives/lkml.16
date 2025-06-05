Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01923C2F;
	Thu,  5 Jun 2025 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749108043; cv=none; b=GVW/3Vf6jL0Jis/mAOjRopdyHLnLri5Lp6w7msZn9wQklUT7Yb683+79rUl9lq7k2ygvdfSjhZUMONdCMLhWRQ/Eiqzg7Z3GuNBGfB1S8nvkKI6OPtmAeDCpFGbYeJpeVAkY9bM5YwJ1MWPKgPrPx++xxiuH7la4B0qt2Mkn+Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749108043; c=relaxed/simple;
	bh=FA625NrqD4qvBQNaAhyUhXitr38lRtVRqZSGqy0z2c4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mecpGLihHG/B1XDmLPl/1xmNNag8zfotePOxSZ6aKIDlxbnukz4z1mTkgCbdEI6e+RT6gm64YtbxMC2mJyEfTpwiQMurScKHw11USdxJAeJuQ6AHZOz4014MV3NCJPf5XZFBeqI+dL435jELEbyDtgDe+ILTQNpjfywohWvUyYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e816uzv9; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e816uzv9"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742af84818cso509789b3a.1;
        Thu, 05 Jun 2025 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749108041; x=1749712841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FA625NrqD4qvBQNaAhyUhXitr38lRtVRqZSGqy0z2c4=;
        b=e816uzv9gIG8vEsENbjOWwrs02bBdj/AGlBZVjlYpHQwsp7iAsaeM3DWZjRLLJUFgq
         KNZXzuNq7A/u/OeO/Ho7Vux+Lk4k+5Osm/uv2ccufxQLLJaWTKoOi6ZyoxV+IHWiFI70
         Mi0mVqhEe19PPF5fLZwOU51DiBpOzNMS7X3Ge1DhZOWGj0mgDRdrAqwUbj/xcPeHGrQk
         mpULj2l4H93vxzt4t3JloCYegXzuJftzgSuRo1JDyDAqRXan3stAw312ZRs2O5EsuYxR
         ilT28CnbKc4OwoBQFqBtoFHsnGIlMhqO/buVloItC8hUTwU215Zy5AseD90qqlo2LT+L
         FBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749108041; x=1749712841;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FA625NrqD4qvBQNaAhyUhXitr38lRtVRqZSGqy0z2c4=;
        b=sUL1VeaiETxTb8NViePtZUnW8sArb7l3BerZwlQGwG6MWFwM9lx+TzVkegtmy9+BxW
         4sgzQmMWH19vt6MXf7xD5tAbJIm3S4+TpTQar2/gAP+wV9/8Yr/rjD8/CBxLZXagh3Q2
         Pk/wuZFdflsDMgkd097nNfEEAWHHp5p1BKd1GrfdGigVMVPEj7sZk0rW1q0UzZCixH4t
         frdlK/LsbqAj4DOynCf9ephH8eczBACBNccL63MnrIANgvNwTNlf1V3eQ3nw06oNjk67
         IVSDU7V+rb7z8IMnTInntbRY9VJDD6iYW3xYewWNzLhv28hW3d7srKABUygfA5kG2nvf
         FD5g==
X-Forwarded-Encrypted: i=1; AJvYcCUdZuJfZ/YNMI3Ar/WfgSojynB3cOUUg/5aXPmXPBfAk0cC6yhg/TSLBdBTK2XIDrb9/W7nayUNMKXFLzs=@vger.kernel.org, AJvYcCXF93ZGz3GoPEC7zDwGHfjZyltSmiWakab5V/tmvrPKST6xnXKqkZ45EMoecG4vIf9uAf8G/HG1HEFd6lKLnUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTuRvm0oFzqGZE/hcV+yugQy0b8qaoqzld/kAcr6q+glWeqgh7
	PwxWc5DAh/QhorjCF+sC2pKhNY90kOW79aGFIAZiVvCHmxO+PVjkCajI
X-Gm-Gg: ASbGncvrHRCeOp6xflhD9QwkHdBPE4+puUXiyNedCKOgncjFersbRhm+RhZKMxAcWci
	PCM1ffQkTswVRzER2ToIqK68Xgf508Q1oKCh7us6AyBlg7I04gMzaSm5aoD/fGlw99ndGLLmgFV
	XxXxejWv756+m3fUeN8pvAxAjKX+m1at15wBW93wJQfl9q0mCL9FaIFKfYTBgjohBZp+gnJQ1BR
	qwV0GGTtdfbUGMA0JMXGh9fxyzQAl1vfIwN+JGc6UfvYawuPwHjtTY+O1eRt2TRxfxiQ0XyAn9H
	rwmOS/HiV+E54KiHR9J/dWBSF5fk6qk/rz5kyiCky1Th4FKXh+v1en6RJYUL1qIEiZGQEOYeR9I
	yNiuZT+hjG2S+vmxvDTPosIQbtKI9kXN+0A==
X-Google-Smtp-Source: AGHT+IFD//RPz7ru1g21LutghSu3t+G8Yuhv3ZX4QuwTNEkZ18KvKr5lhdrA1j/AUPiBIQk/dzX11w==
X-Received: by 2002:a05:6a00:853:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-7480cf8b97amr7468180b3a.14.1749108041124;
        Thu, 05 Jun 2025 00:20:41 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab109sm12229223b3a.40.2025.06.05.00.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:20:40 -0700 (PDT)
Date: Thu, 05 Jun 2025 16:20:22 +0900 (JST)
Message-Id: <20250605.162022.1856520286549134654.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tangyouling@loongson.cn,
 hejinyang@loongson.cn, yangtiezhu@loongson.cn, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH v6 0/4] rust: Add bug/warn abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72=GXWj-aj1kPwnH=9mwR=GgrfJ4xsQUK36SFBRedk3oYg@mail.gmail.com>
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
	<CANiq72=GXWj-aj1kPwnH=9mwR=GgrfJ4xsQUK36SFBRedk3oYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVGh1LCA1IEp1biAyMDI1IDAzOjU2OjMxICswMjAwDQpNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KDQo+IE9uIEZyaSwgTWF5IDIsIDIwMjUg
YXQgMTE6NDbigK9BTSBGVUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5j
b20+IHdyb3RlOg0KPj4NCj4+IFRoaXMgcGF0Y2hzZXQgYWRkcyB3YXJuX29uIG1hY3JvIHdpdGgg
dGhlIGJ1Zy93YXJuIGFic3RyYWN0aW9uIHRoYXQNCj4+IHV0aWxpemVzIHRoZSBrZXJuZWwncyBC
VUcvV0FSTiBmZWF0dXJlIHZpYSBhc3NlbWJseS4NCj4gDQo+IFRoaXMgcGFzc2VkIG15IHVzdWFs
IHRlc3RzIC0tIEkgd2lsbCB0YWtlIGEgYmV0dGVyIGxvb2sgYW5kIHBpY2sgaXQNCj4gZWFybHkg
bmV4dCBjeWNsZS4NCg0KUGVyZmVjdCwgdGhhbmsgeW91IHNvIG11Y2ghDQoNCg==
