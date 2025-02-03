Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB862A1A4;
	Mon,  3 Feb 2025 10:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738579793; cv=none; b=KylqTXfz6Dy8dTyydaGcHA2oUS69Q6azoGa4q8SKmyVphiWb8TfMqjXvpgYoYzb9+ayMH2Nlc6qp5n2GllJBsVUnihFTR2GpjhNAuI1VfzlpZYDsxs/wuXk8W8PsPhkHLp1p/SY+BfCCgLlDldN81jar8AN6ANIs/iYoa/zShKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738579793; c=relaxed/simple;
	bh=7oVhhZQKCHkHXsubLE6xk7AH31b8QAolyV+ctY0SHgI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=e2vS/cjCFPgQf0ndSn/z5NC3ZGr39dd8sAXBI9wByGgYmAyJyDlrzm9S7uX1zyM1YMirfDNdnOqJPgZp6len7VYE0xkBI8iV91rfm1dbsJuPzmN7c7U/Tg0wgAgh/sK1vOntT88q65CN81zxShjY4mTtQ/JZag5biASnJ6X6+48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=nmnLYEFV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=n92hLo4u; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="nmnLYEFV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="n92hLo4u"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 531A213801C5;
	Mon,  3 Feb 2025 05:49:49 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 03 Feb 2025 05:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738579789;
	 x=1738666189; bh=eVAqD0M+j8wVB/yXi1HIVGDMXVj1K/8lSzL/kjBzYnE=; b=
	nmnLYEFV99Pg8eaekRUj2mBRCdcsiFTrl09psUDoohI0OMRNKpBuPVQg7B8niwS2
	gNLBSJmrN8KFjCY7kD5SZ1U+LHi5MzMLq35dPWvVoTVrkK0O7Zsz8g1sUA7RSbzY
	vryq+W94x3xMsw3H1LGIODfcJSQZunm8uzFMQ3iUCv5hDYQunIYdb2MoJNrmAxDT
	r2NOmvGDq/WmWVDQEZ8YaaiRIN4dOHGbTLcXEVUPQoSzvVkHfufGYmqErCPxt1f5
	5k9bxWQB6eO6KgijSxLFs2pRyCSjKzYg8fW7sElhlSOKiGyVX2CidD7dSRN/C8lz
	gds+HfYlyo59DTYid5K1jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738579789; x=
	1738666189; bh=eVAqD0M+j8wVB/yXi1HIVGDMXVj1K/8lSzL/kjBzYnE=; b=n
	92hLo4uGH/PZsBpoKSJ3NGSU8gPtSWuIahWxz5e+ntgiwQ8YlKg2wRxpnyK0Dwmw
	HbeoVDSEI6Yqf3BmOtg+dHME2ER8PiidaNq1hUcZirzTJ8S2zLZVeHuyNSULZ6pT
	df9DyAbWnsVmFY5RosbN3JEN3ddQcAi6bYPFjq8GCO4qEd7N4QfEQtLNZXEmcNG5
	czOfhMu5HcRD3ysF7ZlMSDZpVt1aePo0BSNmIZxC7hzO7AcvBZMlbxBl0STflR0v
	Nu4OS6MqqixTRj1koxNRClboVbs0nvHtQFB6drqsqWq2v2ueixBLL5DawBmax/VZ
	N/yB2H6a7uFcenBQ4oJPQ==
X-ME-Sender: <xms:TJ-gZ3X2oM9YCkIC3vNxP-FI1t3qT20VBejiwu1YMVJA9UUmXyh-rA>
    <xme:TJ-gZ_kpyPa5PMOZbt3FI6-rvxAAccCUDk1c6YLkvqibEWiLJkHWwQc_dVS0_ocyl
    166Fmu3PPGilXrT7HA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeh
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpd
    hrtghpthhtohepjhgrmhgvshdrsghothhtohhmlhgvhieshhgrnhhsvghnphgrrhhtnhgv
    rhhshhhiphdrtghomhdprhgtphhtthhopehjuhhlihgrnhesohhuthgvrhdqlhhimhhith
    hsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqphgrrhhishgtsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:TZ-gZzbt23_rRaM66-ySbco5AVQFukqti5TA6EKnlnoyeW_BEEVzUw>
    <xmx:TZ-gZyXwbc5X-a9Bz-3peJjzoLRG40c6isQmCWCC6CU6-AUlXkQJEQ>
    <xmx:TZ-gZxlC8F5F7VonBsdWe5DTAD-sSf2MVt2ThgJm_QtTHn5CMjFqsQ>
    <xmx:TZ-gZ_c2oWVE0tcO9YxXTfB4NZgxWfHuP1IKlmlHNFRlcgZUo811zA>
    <xmx:TZ-gZ6C2prXrFr8fhoXQz98YjTZmtyzrrL4ym9uX8el2SqHYzuV3fcHW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DCD362220072; Mon,  3 Feb 2025 05:49:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 11:49:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Vetter" <julian@outer-limits.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <93870187-086a-4536-9c7e-992f3bd7ecf7@app.fastmail.com>
In-Reply-To: <65e57211-7983-477a-af94-1bdab57574b4@outer-limits.org>
References: <20250130134825.2646380-1-julian@outer-limits.org>
 <543bd0f6-b25d-48b4-8039-496b8ddd10ce@app.fastmail.com>
 <65e57211-7983-477a-af94-1bdab57574b4@outer-limits.org>
Subject: Re: [PATCH] parisc: Remove memcpy_fromio
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Feb 3, 2025, at 11:21, Julian Vetter wrote:
> On 1/31/25 08:28, Arnd Bergmann wrote:
>> Those functions have been unchanged since before the git
>> history and there are some comments that I don't find helpful.
>> One thing they do is to deal with unaligned memory buffers,
>> which the generic ones don't, but that could be easily added
>> using get_unaligned/put_unaligned, expecting the compiler
>> to optimize the memory side of the transfer.
>
> I'm not sure what you suggest. Do you mean adding 
> get_unaligned/put_unaligned in the generic include/asm-generic/io.h 
> functions, or just adding get_unaligned/put_unaligned to the body of the 
> parisc specific functions? Instead of all the "switch... case 0x2..." code?

I meant adding put_unaligned/get_unaligned like this:

--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -422,7 +422,8 @@ static inline void readsw(const volatile void __iomem *addr, void *buffer,
 
                do {
                        u16 x = __raw_readw(addr);
-                       *buf++ = x;
+                       put_unaligned(x, buf);
+                       buf++;
                } while (--count);
        }
 }

This has no effect on architectures that can handle unaligned
load/store on memory, and should behave the same way as the
parisc code otherwise. On powerpc and possibly others, there
needs to be a barrier (eieio() on powerpc) inside of the loop,
according to Segher's earlier comments.

     Arnd
