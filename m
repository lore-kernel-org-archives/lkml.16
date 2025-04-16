Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43F215E96;
	Wed, 16 Apr 2025 02:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744768957; cv=none; b=u5+VQYjeT06WwLiAeMzJdk1cyKQrEEZdITDIY4WIISMEC9msTubmelRZ7fjNn44fGrknztrTxDncXBH2JFHw7ke6dDauhc5XphgUAiG1GT4f2nUEXTGH9Ky933umKWKWxkW58QRmt86KtLnxZy+JOEnxS0Y3epoHxddtF49/QaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744768957; c=relaxed/simple;
	bh=v4/phJQUAPeOK41LzcUnYsiA3yKOssm+W9ZqAkAigfk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IcCtjsOEa9GTFU/3bmiLplb0uVEgkMqBRXCbMleI5+fmf/I1vO5RQbDAorZKhxHWW5kHEBcD7dTJSkXmYIj4xJXT7QeCvWweDvNYyCmMq3ARDQfXltwfIao5w5vz2iwWJYbfO3V2WRs4QjR9yrG5nWkAgGwMv5ZiF596nfUsCNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Ej2oNmKq; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Ej2oNmKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744768642; bh=KvSaTgFS8WeHQJzlGw/Ub9odmid7Z1N7H4quqWzN/KM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ej2oNmKqHZ67Gedex9lBRdzlaMtU6fbb/ZGtWGXavGc4M1zV5/0rp0WnkniLrn4Dd
	 9MrWUAZ0wiaEseQIKi6nMwEbDWav5A5W+qYmeSFG9UchjSgXfSPdBUBMSj0isUYura
	 IeGYWFsSfMG5NPKef7Jp4PTzu6fShHsqre+1LMTQ=
Received: from ubuntu.localdomain ([218.104.140.83])
	by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
	id E53888DF; Wed, 16 Apr 2025 09:57:19 +0800
X-QQ-mid: xmsmtpt1744768639t22hacpvg
Message-ID: <tencent_607C227A96060DD8EC83C78184305D264109@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntuj9RM+yAw0CZYpw+uCKkqPhP58CShgWJ3pZMIQUoXQdBNpE0P0Y5
	 I/40uwm6/Uggqid2uq66wyBQT3D/ZP43ANKRcULFnBEBFUq23dD5eE5GBWSrglZBANiNDWQ402u/
	 altPJVOP8Luscihfv40JmXKB24hE6pJkKeaZqukpMauThdb429rnZpoJb2MsaQwwx8YBGPSwTyn+
	 H6P1rR0Y1wBZdUW6oBw/h1Pn/7DerkgH/Qc3scNlnM6SEVY0zhwhrJ/86vr+JFyD/hNlR+8QAKxh
	 Txvba5BAFLqjRijf+4cejOV7jE4cZ7yq6U4sQKXmc12fkmOFsIsxBUO6eOWPrUh4dWNwqd7OEPao
	 cD0XJCGTuo9iUtqbW+aUfESiMkot9+COyxPezhQMhl7nMrXfv2pD/vYwwYVXi7GowLJJXBfLXtog
	 hFi2ZzMqE8QWSkcxs04IbYCTIfS0aItfDk++HMkE1kKNu06l267A6IzJ68Q4PR0Rg0DOJ1/G4j9D
	 NW9TpraqOxuTgNRbJn9ypOvBK8WdOwYHNDh738Kj7my2ON5YeJpvUW/CLg3o91JI2N9QnuuD19Fa
	 40BBxM7nziWBNjPJ37c4iB2d8hzi0qt6gdt4aRq/dEsC5Tx1ksdu4fgMVfmBhdZmTGkOeFZnhHR8
	 NsdDDf/6qU383/htCJPGsehvQ5P94YCcFc9KidTObcI8VIzPBG/Jkuktc74Mg4hXRHKsSxEXtZoF
	 DtKWcU5bArEtVzsi+544NirU7bmj/J4BjpzY73VN+yKCGjUd+qlX4fxzWmAAacb/o2NL3x6IY5Uq
	 ccJTOYQskwQd6PJnMNMLxm88xcF1IIUqJDXlVRQCgvbNMoha/0nCGIgJlOyFk5UNkl++0IusKfwB
	 WCyAZIfEeuoi0y4pXfY32wOpEwIsyrQ+86x4I7N36CdoSLsGGZKprW48Bh9JtiWjATHqejL1QRr6
	 J6LZSu4WM=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: 1425075683@qq.com
To: robh@kernel.org
Cc: 1425075683@qq.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	m.szyprowski@samsung.com,
	saravanak@google.com
Subject: Re: [PATCH] of: reserved-mem: Warn for missing initfn in __reservedmem_of_table
Date: Wed, 16 Apr 2025 09:57:08 +0800
X-OQ-MSGID: <20250416015707.11088-1-1425075683@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAL_Jsq++MbY=s5t1hmE0AhcmFA14t3fxLM1xPFZAA0ETX_ee-g@mail.gmail.com>
References: <CAL_Jsq++MbY=s5t1hmE0AhcmFA14t3fxLM1xPFZAA0ETX_ee-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Tue, Apr 15, 2025 at 9:16 AM Liya Huang <1425075683@qq.com> wrote:
> >
> > For the data in __reservedmem_of_table, its function pointer initfn might
> > be NULL. However, __reserved_mem_init_node() only considers non-NULL cases
> > and ignores NULL function pointers.
>
> If initfn is NULL, there's no point to the entry and that's a bug.
> Unless you have a build time check, there's no point to add this.
> 
> Rob

Thank you for your response. Based on your suggestion, I have made the 
modifications and used static_assert() to perform the check at compile 
time. The specific code is as follows. Could you please review whether 
this modification is reasonable? If it is acceptable, I will proceed with 
submitting the patch.

I did not find any usage of static_assert() for null pointer checks in the
kernel code. Additionally, BUILD_BUG_ON() cannot be used globally.

---
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e338282da652..87446ad2deb2 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -29,6 +29,7 @@ typedef int (*reservedmem_of_init_fn)(struct reserved_mem *rmem);
 #ifdef CONFIG_OF_RESERVED_MEM
 
 #define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
+	static_assert((init) != NULL);	\
 	_OF_DECLARE(reservedmem, name, compat, init, reservedmem_of_init_fn)
 
 int of_reserved_mem_device_init_by_idx(struct device *dev,
---

Thanks,
-- 
Liya Huang <1425075683@qq.com>

