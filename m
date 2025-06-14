Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8A525E81F;
	Sat, 14 Jun 2025 07:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749885374; cv=none; b=eL3LqQtQJ8JkJgjDBhGw1jCiW4psLjJbx79mng5rAdwdnxtvCRN50VIHCo7VIsgBieaBHhc3vTSGggTHQ+t0tSdq6yYneX2fh/65f+sz+M7kedSvpAZU7St18gY6K67FYFCy66wEW87b1GEmaNPwruSwW1BQNlk5+bUdrUQ+fHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749885374; c=relaxed/simple;
	bh=yciwLt7wp+dwcJIKC62LngnVBnL7d0Ndo4pIUaoQQ9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hi+NU4W6PRQ8LoayuchKFGlTYGAQt1zwrIes6H9G4379rHo0AeqvBWuQ2vFG8WiHZBQjuNV7Va8KjWVjIJBFIaLGQGZAD+axhWBYqqgmr2HKAPWaxeQndE4cEOKDA4q/SpCZK2v6vsZqrzd7Fg278uflKkrGSaLzrURXJru6PLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXqRnoDf; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXqRnoDf"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-606b6dbe316so5840989a12.3;
        Sat, 14 Jun 2025 00:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749885371; x=1750490171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yciwLt7wp+dwcJIKC62LngnVBnL7d0Ndo4pIUaoQQ9s=;
        b=eXqRnoDf6sinIBgByx45vbYihU9cQwY9gHSybg37tbphrt2DFKlmDhI0C9QCyYA1B+
         mQC03P6f75hXLUma+MZ4nTA/zrnujqVx6cf0/GN/s2Udz5poYQfeQfUEufT30XL+16Qa
         bmpLdXS8AWbaKiMkK9ArjD3pwYP91aQkWG6xw0G06MGr/5COTP5e5YytM3nL161LeKzM
         2QsAhJqvn2+xbERPWQIRYiN7iJ7PMqje4fw4usmOIIZSjugSRlAdRzOpKhkC3d4bYUSz
         23MW9Vg83KK186SuOE7lSDbamJWBl5NH15k1LnMlzSY2+qhS4nM8l+yINR0p86gjxqLC
         Y0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749885371; x=1750490171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yciwLt7wp+dwcJIKC62LngnVBnL7d0Ndo4pIUaoQQ9s=;
        b=a4qarP1L//keMDJXIIB9Tt/nKQcvVTomYpoZYLpo/mDeWV/Yyrd87EZGt6z3AFZ1F8
         431/Q43e0OG0nnMjhAVG7gZcAiUx2OeYa/GmdWSlmli4B9uLaRItQfOpgBgQDYbqb0iI
         kXRPc8r/Bhw4TbSrr+4bfpeaxmBFiEqiCNkHCef4qBT4v9oHRKaBzjiCBKV+gJSQW0dM
         yX2XzEb8v975MaoodD3+MBY4yQd7G+2eyG2avwzFwX2o1yVR86/ldtGEtShUC5GpK8s1
         sZRhW9gqS/Jc0mu6oI/n7hMMj1gyWHHewzocbAoHOkhbEFigbV1z1/yRbx8ydBo7ooSX
         By4A==
X-Forwarded-Encrypted: i=1; AJvYcCVGXE4qgGhwwVrWsfpIamZmso5bCUkSzl2//MmmvXX9xd43Y+MRDJ8NDmeWctyLstbQeZsyMY/VaUG94hlJ@vger.kernel.org, AJvYcCWFb2X+uvyKKhKEh2vGSJTEY/O666mG5uGD8zhbATMO/UlcS19OwAgoX/ejjEWZDhDcXw8CwxJ0tvM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5TdAqo9lNvgx1loedQkjnLzRAOkYBNbjqx4yI3F5NsBD6sygF
	/fjHcFQUPr0XC3P4Kw0pyuomHNMLmNi9nIqoMizsihDkMZiZRtm9z4Qg3FP5RqDBaSJf4ctjw4V
	HouKdbIPzKi1TqGifDcA0uRY/sMItWlA=
X-Gm-Gg: ASbGncvLXUydjEIUU8Z07XnRumu9qQ1QiZHk3EEniqu9p2+uvMU/tY/60ObnBdi5O1K
	cZfToKzroHDvNxjAiNK4baui46Wuq2KV00h8Medll5qzdjVhotUyHZCzDJLsLU9uTi4MOQ1STUo
	rdfXoBhcdMeM+vlIkPNrh+jBSkPe5JhWmPkZ8U4Mvhu6U=
X-Google-Smtp-Source: AGHT+IGXn4N9fnaUuCwKFSUQ/eMeT/8y9J36lh4Ni5r+t8BlZITT9UFwhRFuilZD4wP7nL/uUFjTpV8dE9g3AC0UC/I=
X-Received: by 2002:a05:6402:2791:b0:607:33ca:ee14 with SMTP id
 4fb4d7f45d1cf-608d0996774mr1422145a12.29.1749885370507; Sat, 14 Jun 2025
 00:16:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603110337057ZRxTnZrzJ39S_CAoGTJ5D@zte.com.cn> <371b632f-3522-4b8e-8e2f-4e3c53a7c047@hust.edu.cn>
In-Reply-To: <371b632f-3522-4b8e-8e2f-4e3c53a7c047@hust.edu.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Sat, 14 Jun 2025 15:15:33 +0800
X-Gm-Features: AX0GCFuHDWYfqeOunt_qIhLI4lWcr49pd_3aQJq0IwbsjehjuM8UHRhBrpvxXJo
Message-ID: <CAJy-Amng8wNFH6FGZCsCUBodopKi9VhqhqWBjK--TADsHjmbMQ@mail.gmail.com>
Subject: Re: [PATCH linux next v2] Docs/zh_CN: Translate vxlan.rst to
 Simplified Chinese
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: jiang.kun2@zte.com.cn, alexs@kernel.org, si.yanteng@linux.dev, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xu.xin16@zte.com.cn, yang.yang29@zte.com.cn, fan.yu9@zte.com.cn, 
	qiu.yutan@zte.com.cn, wang.yaxin@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

QXBwbGllZCwgVGhhbmtzIQ0KDQpEb25nbGlhbmcgTXUgPGR6bTkxQGh1c3QuZWR1LmNuPiDkuo4y
MDI15bm0NuaciDPml6XlkajkuowgMTE6MTDlhpnpgZPvvJoNCj4NCj4NCj4gT24gNi8zLzI1IDEx
OjAzIEFNLCBqaWFuZy5rdW4yQHp0ZS5jb20uY24gd3JvdGU6DQo+ID4gRnJvbTogUWl1IFl1dGFu
IDxxaXUueXV0YW5AenRlLmNvbS5jbj4NCj4gPg0KPiA+IHRyYW5zbGF0ZSB0aGUgInZ4bGFuLnJz
dCIgaW50byBTaW1wbGlmaWVkIENoaW5lc2UNCj4gPg0KPiA+IFVwZGF0ZSB0byBjb21taXQgMzNh
MWFhZjgyYmNmKCJkb2NzOiB2eGxhbjogYWRkIGluZm8NCj4gPiBhYm91dCBkZXZpY2UgZmVhdHVy
ZXMiKQ0KPiBSZXZpZXdlZC1ieTogRG9uZ2xpYW5nIE11IDxkem05MUBodXN0LmVkdS5jbj4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFFpdSBZdXRhbiA8cWl1Lnl1dGFuQHp0ZS5jb20uY24+DQo+
ID4gU2lnbmVkLW9mZi1ieTogRmFuIFl1IDxmYW4ueXU5QHp0ZS5jb20uY24+DQo+ID4gU2lnbmVk
LW9mZi1ieTogSmlhbmcgS3VuIDxqaWFuZy5rdW4yQHp0ZS5jb20uY24+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogeHUgeGluIDx4dS54aW4xNUB6dGUuY29tLmNuPg0KPiA+IC0tLQ0KPg0KPiBIaSBRaXUs
DQo+DQo+IE5leHQgdGltZSwgcGxlYXNlIGFkZCB0aGUgY2hhbmdlbG9nIGhlcmUsIGUuZy4sICJ2
MS0+djI6IHJlbW92ZSByc3Qgc3VmZml4Ii4NCj4NCj4gRG9uZ2xpYW5nIE11DQo+DQo+ID4gICAu
Li4vdHJhbnNsYXRpb25zL3poX0NOL25ldHdvcmtpbmcvaW5kZXgucnN0ICAgfCAgMiArLQ0KPiA+
ICAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9uZXR3b3JraW5nL3Z4bGFuLnJzdCAgIHwgODUgKysr
KysrKysrKysrKysrKysrKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vbmV0d29ya2luZy92eGxhbi5yc3QNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9uZXR3b3JraW5nL2luZGV4LnJz
dCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL25ldHdvcmtpbmcvaW5kZXgucnN0
DQo+ID4gaW5kZXggZDA3ZGQ2OWY5ODBiLi4wZWY2ZGQ5ODk2MTUgMTAwNjQ0DQo+ID4gLS0tIGEv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbmV0d29ya2luZy9pbmRleC5yc3QNCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9uZXR3b3JraW5nL2luZGV4
LnJzdA0KPiA+IEBAIC0yMSw2ICsyMSw3IEBADQo+ID4gICAgICA6bWF4ZGVwdGg6IDENCj4gPg0K
PiA+ICAgICAgbXNnX3plcm9jb3B5DQo+ID4gKyAgIHZ4bGFuDQo+ID4NCj4gPiAgIFRvZG9saXN0
Og0KPiA+DQo+ID4gQEAgLTE0Miw3ICsxNDMsNiBAQCBUb2RvbGlzdDoNCj4gPiAgICogICB0dW50
YXANCj4gPiAgICogICB1ZHBsaXRlDQo+ID4gICAqICAgdnJmDQo+ID4gLSogICB2eGxhbg0KPiA+
ICAgKiAgIHgyNQ0KPiA+ICAgKiAgIHgyNS1pZmFjZQ0KPiA+ICAgKiAgIHhmcm1fZGV2aWNlDQo+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL25ldHdvcmtp
bmcvdnhsYW4ucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbmV0d29ya2lu
Zy92eGxhbi5yc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAw
MDAwMC4uZTMxOWVkZGZjZGJlDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL25ldHdvcmtpbmcvdnhsYW4ucnN0DQo+ID4gQEAgLTAs
MCArMSw4NSBAQA0KPiA+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25s
eSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NO
LnJzdA0KPiA+ICsNCj4gPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvdnhs
YW4ucnN0DQo+ID4gKw0KPiA+ICs657+76K+ROg0KPiA+ICsNCj4gPiArIOiMg+mbqCBGYW4gWXUg
PGZhbi55dTlAenRlLmNvbS5jbj4NCj4gPiArDQo+ID4gKzrmoKHor5E6DQo+ID4gKw0KPiA+ICsg
LSDpgrHnprnmva0gUWl1IFl1dGFuIDxxaXUueXV0YW5AenRlLmNvbS5jbj4NCj4gPiArIC0g5b6Q
6ZGrIHh1IHhpbiA8eHUueGluMTZAenRlLmNvbS5jbj4NCj4gPiArDQo+ID4gKz09PT09PT09PT09
PT09PT09PT09PT09PT09DQo+ID4gK+iZmuaLn+aJqeWxleacrOWcsOWxgOWfn+e9keWNj+iuruaW
h+ahow0KPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiArVlhMQU4g
5Y2P6K6u5piv5LiA56eN6Zqn6YGT5Y2P6K6u77yM5peo5Zyo6Kej5YazIElFRUUgODAyLjFxIOS4
rSBWTEFOIElE77yINDA5Nu+8ieaciemZkOeahOmXrumimOOAgg0KPiA+ICtWWExBTiDlsIbmoIfo
r4bnrKbnmoTlpKflsI/mianlsZXliLAgMjQg5L2N77yIMTY3NzcyMTbvvInjgIINCj4gPiArDQo+
ID4gK1ZYTEFOIOWcqCBJRVRGIFJGQyA3MzQ4IOS4rei/m+ihjOS6huaPj+i/sO+8jOW5tuW3sueU
seWkmuWutuS+m+W6lOWVhuiuvuiuoeWunueOsOOAgg0KPiA+ICvor6XljY/orq7pgJrov4cgVURQ
IOWNj+iurui/kOihjO+8jOW5tuS9v+eUqOeJueWumuebrueahOerr+WPo+OAgg0KPiA+ICvmnKzm
lofmoaPku4vnu43kuoYgTGludXgg5YaF5qC46Zqn6YGT6K6+5aSH77yMT3BlbnZzd2l0Y2gg5Lmf
5pyJ5Y2V54us55qEIFZYTEFOIOWunueOsOOAgg0KPiA+ICsNCj4gPiAr5LiO5aSn5aSa5pWw6Zqn
6YGT5LiN5ZCM77yMVlhMQU4g5pivIDEg5a+5IE4g55qE572R57uc77yM6ICM5LiN5LuF5LuF5piv
54K55a+554K5572R57uc44CCDQo+ID4gK1ZYTEFOIOiuvuWkh+WPr+S7pemAmui/h+exu+S8vOS6
juWtpuS5oOahpeaOpeWZqOeahOaWueW8j+WKqOaAgeWtpuS5oOWPpuS4gOerr+eCueeahCBJUCDl
nLDlnYDvvIzkuZ/lj6/ku6XliKnnlKjpnZnmgIHphY3nva7nmoTovazlj5HmnaHnm67jgIINCj4g
PiArDQo+ID4gK1ZYTEFOIOeahOeuoeeQhuaWueW8j+S4juWug+eahOS4pOS4qui/kemCuyBHUkUg
5ZKMIFZMQU4g55u45Ly844CCDQo+ID4gK+mFjee9riBWWExBTiDpnIDopoEgaXByb3V0ZTIg55qE
54mI5pys5LiOIFZYTEFOIOmmluasoeWQkeS4iua4uOWQiOW5tueahOWGheaguOeJiOacrOebuOWM
uemFjeOAgg0KPiA+ICsNCj4gPiArMS4g5Yib5bu6IHZ4bGFuIOiuvuWkhzo6DQo+ID4gKw0KPiA+
ICsgICAgICMgaXAgbGluayBhZGQgdnhsYW4wIHR5cGUgdnhsYW4gaWQgNDIgZ3JvdXAgMjM5LjEu
MS4xIGRldiBldGgxIGRzdHBvcnQgNDc4OQ0KPiA+ICsNCj4gPiAr6L+Z5bCG5Yib5bu65LiA5Liq
5ZCN5Li6IHZ4bGFuMCDnmoTnvZHnu5zorr7lpIfvvIzor6Xorr7lpIfpgJrov4cgZXRoMSDkvb/n
lKjnu4Tmkq3nu4QgMjM5LjEuMS4xIOWkhOeQhui9rOWPkeihqOS4reayoeacieWvueW6lOadoeeb
rueahOa1gemHj+OAgg0KPiA+ICvnm67moIfnq6/lj6Plj7forr7nva7kuLogSUFOQSDliIbphY3n
moTlgLwgNDc4Oe+8jFZYTEFOIOeahCBMaW51eCDlrp7njrDml6nkuo4gSUFOQSDpgInmi6nmoIfl
h4bnm67nmoTnq6/lj6Plj7fnmoTml7bpl7TjgIINCj4gPiAr5Zug5q2k6buY6K6k5L2/55SoIExp
bnV4IOmAieaLqeeahOWAvO+8jOS7peS/neaMgeWQkeWQjuWFvOWuueaAp+OAgg0KPiA+ICsNCj4g
PiArMi4g5Yig6ZmkIHZ4bGFuIOiuvuWkhzo6DQo+ID4gKw0KPiA+ICsgICAgICMgaXAgbGluayBk
ZWxldGUgdnhsYW4wDQo+ID4gKw0KPiA+ICszLiDmn6XnnIsgdnhsYW4g6K6+5aSH5L+h5oGvOjoN
Cj4gPiArDQo+ID4gKyAgICAgIyBpcCAtZCBsaW5rIHNob3cgdnhsYW4wDQo+ID4gKw0KPiA+ICvk
vb/nlKjmlrDnmoQgYnJpZGdlIOWRveS7pOWPr+S7peWIm+W7uuOAgemUgOavgeWSjOaYvuekuiB2
eGxhbiDovazlj5HooajjgIINCj4gPiArDQo+ID4gKzEuIOWIm+W7unZ4bGFu6L2s5Y+R6KGo6aG5
OjoNCj4gPiArDQo+ID4gKyAgICAgIyBicmlkZ2UgZmRiIGFkZCB0byAwMDoxNzo0Mjo4YTpiNDow
NSBkc3QgMTkyLjE5LjAuMiBkZXYgdnhsYW4wDQo+ID4gKw0KPiA+ICsyLiDliKDpmaR2eGxhbui9
rOWPkeihqOmhuTo6DQo+ID4gKw0KPiA+ICsgICAgICMgYnJpZGdlIGZkYiBkZWxldGUgMDA6MTc6
NDI6OGE6YjQ6MDUgZGV2IHZ4bGFuMA0KPiA+ICsNCj4gPiArMy4g5pi+56S6dnhsYW7ovazlj5Ho
oajpobk6Og0KPiA+ICsNCj4gPiArICAgICAjIGJyaWRnZSBmZGIgc2hvdyBkZXYgdnhsYW4wDQo+
ID4gKw0KPiA+ICvku6XkuIvnvZHnu5zmjqXlj6PmjqfliLblmajnibnmgKflj6/og73ooajmmI7l
r7kgVURQIOmap+mBk+ebuOWFs+eahOWNuOi9veaUr+aMge+8iOacgOW4uOingeeahOaYryBWWExB
TiDlip/og73vvIwNCj4gPiAr5L2G5piv5a+554m55a6a5bCB6KOF5Y2P6K6u55qE5pSv5oyB5Y+W
5Yaz5LqO572R57uc5o6l5Y+j5o6n5Yi25Zmo77yJ77yaDQo+ID4gKw0KPiA+ICsgLSBgdHgtdWRw
X3RubC1zZWdtZW50YXRpb25gDQo+ID4gKyAtIGB0eC11ZHBfdG5sLWNzdW0tc2VnbWVudGF0aW9u
YA0KPiA+ICsgICAg5a+5IFVEUCDlsIHoo4XluKfmiafooYwgVENQIOWIhuauteWNuOi9veeahOiD
veWKmw0KPiA+ICsNCj4gPiArIC0gYHJ4LXVkcF90dW5uZWwtcG9ydC1vZmZsb2FkYA0KPiA+ICsg
ICAg5Zyo5o6l5pS256uv6Kej5p6QIFVEUCDlsIHoo4XluKfvvIzkvb/nvZHnu5zmjqXlj6Pmjqfl
iLblmajog73lpJ/miafooYzljY/orq7mhJ/nn6Xljbjovb3vvIwNCj4gPiArICAgIOS+i+WmguWG
hemDqOW4p+eahOagoemqjOWSjOmqjOivgeWNuOi9ve+8iOWPquacieS4jeW4puWNj+iuruaEn+ef
peWNuOi9veeahOe9kee7nOaOpeWPo+aOp+WItuWZqOaJjemcgOimge+8iQ0KPiA+ICsNCj4gPiAr
5a+55LqO5pSv5oyBIGByeC11ZHBfdHVubmVsLXBvcnQtb2ZmbG9hZGAg55qE6K6+5aSH77yM5Y+v
5L2/55SoIGBldGh0b29sYCDmn6Xor6LlvZPliY3ljbjovb3nq6/lj6PnmoTliJfooag6Og0KPiA+
ICsNCj4gPiArICAkIGV0aHRvb2wgLS1zaG93LXR1bm5lbHMgZXRoMA0KPiA+ICsgIFR1bm5lbCBp
bmZvcm1hdGlvbiBmb3IgZXRoMDoNCj4gPiArICAgIFVEUCBwb3J0IHRhYmxlIDA6DQo+ID4gKyAg
ICAgIFNpemU6IDQNCj4gPiArICAgICAgVHlwZXM6IHZ4bGFuDQo+ID4gKyAgICAgIE5vIGVudHJp
ZXMNCj4gPiArICAgIFVEUCBwb3J0IHRhYmxlIDE6DQo+ID4gKyAgICAgIFNpemU6IDQNCj4gPiAr
ICAgICAgVHlwZXM6IGdlbmV2ZSwgdnhsYW4tZ3BlDQo+ID4gKyAgICAgIEVudHJpZXMgKDEpOg0K
PiA+ICsgICAgICAgICAgcG9ydCAxMjMwLCB2eGxhbi1ncGUNCj4NCg==
