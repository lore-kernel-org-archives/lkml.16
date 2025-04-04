Received: from fallback13.i.mail.ru (fallback13.i.mail.ru [79.137.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB432E62CE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 05:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743744630; cv=none; b=jnddNPapREtYk0DfUBmOKQ723FW510v8qheTOtWlsGXkpI7t/Cttrc8KDk5eEo+oT2YdGc8rxGG2caHthQeXlJzjeZ1kCBPydnopPS1uSdZIHUZyU5PtEHBcKD5Jx5s5eicEOoCwMc+vs0vSYRTWMsMIIclhiumV6Blg+mP1I9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743744630; c=relaxed/simple;
	bh=wtE6KoTMWUPBeA0jhKczD7mOBWuhk6RlM7jIMKqRoI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q4bB/W2fJAABWDej83oDYMyPCSb6UqOmk3m19cX23vFgNDjHiGAl92cJcSA8pLam3S4kvFJg25w7xcUG/14X7IJ0zTQAMMODZ+Ry75AJ03y+/j5gvnb04iLffNVa4pAbZIceq5V7q02dLw8dEAPkTMdkLHPA3P3Cm3I4r8uGllk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=U3ebyJ8S; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=C0RBQ4ms; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=vwuP+D0C; arc=none smtp.client-ip=79.137.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="U3ebyJ8S";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="C0RBQ4ms";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="vwuP+D0C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=qCRKNJ6TKOGNtu/HB/ShbWp64AAzz59sXZSjteisduQ=;
	t=1743744625;x=1743834625; 
	b=U3ebyJ8SQCGstvBYI18krvyaOgTgnLKd0dtT1nkB0Kc3yBn7V01TRualxrIK7/8DAHOI+fOuZUm5Af9dtZoZnVv2Rk8uSmFoKZwteey15x4AQdYtRraA4Rnk12wtXLCQOmNsA2RNdxo7kdsyUuPrqO+Cb7WOPxlR+JGxjwgS0qp5ABk4xrrrvxsVPalQQxnGNKX2Cs5s3OKITJKQbqdZUedqgTw5kZSb7jbhbNIGeir6q3uM5bdM/kcrlxAX0yRsBzN9KOz0WuVjgRTSUDZdlle5j+mmr84oyDTzAlIVCEl1npkLXuFnEicvNZsA0XN7tuumbgSxtSiNLQALKaiOpA==;
Received: from [10.112.250.155] (port=49436 helo=send54.i.mail.ru)
	by fallback13.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1u0ZFj-002wYd-PU
	for linux-kernel@vger.kernel.org; Fri, 04 Apr 2025 08:06:03 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=qCRKNJ6TKOGNtu/HB/ShbWp64AAzz59sXZSjteisduQ=; t=1743743163; x=1743833163; 
	b=C0RBQ4msxO6dWnZLhV3rihjVdxA0OlZk9eRde+yt5i/mOlV0FmfgHmCVgSZdUSY2doS4teixuPh
	bnN6n0Z3bDIYya9hJfxMt8A+Ck0mnAWYuzZeijpxQ4cRBIxn8WqIuSVnjp1Yj4nOk8ZWEeLVgRKFk
	0j1B0ZepckP2g5MbMEhuhXE+O2pHCx//2ie1zrd9hwYsopULg4P2bGjY8w4n1PtQOoZ7AFSeBr4rO
	uHlgVA1TgUmcUPOdN06JgiX3pYi4jIvmKQlqg+oZ/yrHaWwC5rQK/ZQ9SQLG+8Ff/fQG/sjk/3WlN
	ZQjxLUqUpoCITn/eJGxak5zy5VxeUhX+kkmQ==;
Received: from [10.113.31.45] (port=33986 helo=send172.i.mail.ru)
	by exim-fallback-7687f6b856-k8h7p with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1u0ZFb-000000003Kq-420u
	for linux-kernel@vger.kernel.org; Fri, 04 Apr 2025 08:05:56 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=qCRKNJ6TKOGNtu/HB/ShbWp64AAzz59sXZSjteisduQ=; t=1743743155; x=1743833155; 
	b=vwuP+D0CbU9AvPvsl05Y7XtZUsbKWbO074KsGc9drmj+YrJDaY0fY2Cz1VkMadIv9devG5I8Ohr
	QbRCObwbFksA9wDQ38E4PykqpNNcnra2t99BSn4si4HhYIkkadDeNFb3T9ybhyy/CrGN+v0V5r99w
	S1id7UCWHVt6p6R7n7BQF26MtNU5EqcfiitWWtrZru5YH+Lsvvp8RbP1Rl41tv7SJFHp7Jncok+Oy
	kkjLsyZJwUcJIAwNYyXm3BbA3n3S992udTq74aO9JXPXqN+31t9B/uXnoxgwEKYgWvEF5yrIwrYY6
	4ijfSPbky2BSEkroB+aP8nDR7zd65+5jlrcQ==;
Received: by exim-smtp-895bd549-rm27q with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1u0ZFQ-000000006VZ-46k6; Fri, 04 Apr 2025 08:05:45 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	peterz@infradead.org,
	elver@google.com,
	namcao@linutronix.de,
	tglx@linutronix.de,
	samuel.holland@sifive.com,
	daniel.lezcano@linaro.org,
	apatel@ventanamicro.com
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Subject: [PATCH 1/1] time/sched_clock: move sched_clock_register() out of .init section
Date: Fri,  4 Apr 2025 08:05:40 +0300
Message-ID: <20250404050540.13507-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD97BB0EF39AD2B33D5BD60E8C87DB2D982134ABF3320BD5053182A05F538085040D6D4A5DE20558E133DE06ABAFEAF670551C19575E9DC620F6A8EE8716F45326E855C50119FE1CC9E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE746D93DAA4671895CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375669E7A8FB0630A8A263D3AA1BB23A200624CF4DA3FA0C56F8A59D233FAEF5DE2688EEF46B7454FC60B9742502CCDD46D0DEDCF5861DED71B2F389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C07734D68A6916D8318941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B64AAE2D1698E8717BCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166176DF2183F8FC7C0E4A630A5B664A4FF725E5C173C3A84C309A7649CC036878F35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A51B832C159022EF245002B1117B3ED696285A88008676CBA07E0012C66AE17B00823CB91A9FED034534781492E4B8EEAD303003AC7AA20DD0C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34A246DFF68F0EE19E0B718E1CA6C4A0EA57B80ABE69FCF18BF2D00F8CB0FB7206546FDF43544AD09F1D7E09C32AA3244C37A6E747837C8E0A77DD89D51EBB77425216AF1FEBB2E6EAEA455F16B58544A29A21F9916E05C5175DA084F8E80FEBD3498BCAF62EB65D490083D0702184784583DB18EBE73F7D69
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEtmzbc7E3ThzAJuJ7cdLsSQw==
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB622204DB50A0B48B6F1A4CC75B5106BE2DAAA841C0BA25B4D90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B46E61CDDA35D5C24823C47167D7D275A3D17BA7EC88F7564A049FFFDB7839CE9E35FFF2E34BDEBBBFF7255DE1D2081B8747E6BBBB5EEABDF08399709DA961A097F75F8A4B441D6C6B
X-7FA49CB5: 0D63561A33F958A5444E19FB7F75567E5002B1117B3ED696B34F5D036E69345C7F318CC1AC4EAD5F02ED4CEA229C1FA827C277FBC8AE2E8B53826C240F51450E
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZNLVYoBBAN4tugxhSNTw5Ww==
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B46E61CDDA35D5C24823C47167D7D275A3F73A85F335836373049FFFDB7839CE9E35FFF2E34BDEBBBF55BAACED10BBC09128E3EB206C900D45E4C832A098B51E33
X-7FA49CB5: 0D63561A33F958A5B1ECCA99ADAE75CECE6E805C32BD68B37B61F4DBA387EC59CACD7DF95DA8FC8BD5E8D9A59859A8B6A096F61ED9298604
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZNLVYoBBAN4toXJAaMWDS4Q==
X-Mailru-MI: 20000000000000800
X-Mras: Ok

The sched_clock_register() is widely used by clocksource timer
drivers. The __init prefix forces them to be initialized using
macro TIMER_OF_DECLARE with __init prefixed function.

Clocksource devices can be consumers of some external irq, clocks,
resets, e.t.c. Such devices can't be correctly probed if this
dependencies are provided by platform drivers. Because of regular
platform devices are not probed at this moment.

We can convert clocksource drivers to platform device drivers to
fix this issue, but __init prefix in sched_clock_register()
prevents it.

So lets drop __init prefix to allow platform device drivers to use
sched_clock_register().

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 kernel/time/sched_clock.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index cc15fe293719..07f28e0e2716 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -174,8 +174,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
 	return HRTIMER_RESTART;
 }
 
-void __init
-sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
+void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 {
 	u64 res, wrap, new_mask, new_epoch, cyc, ns;
 	u32 new_mult, new_shift;
-- 
2.48.1

