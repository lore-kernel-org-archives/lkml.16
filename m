Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1B92AE90
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 02:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738551059; cv=none; b=Eik+zAnCZZFMecYbsm5ajiZhJNwGqPDkkMXUdYWJxq6rcm/6B4epQRLpMIuGPZOFoYE+lPyJVst3yL0XLjYO06TwrPiUZKBALLk7OywhSF7B9634lyESNU972b+3shveMgs5uc8Tptmq+aD1sRIG28GAmDYHGBz/YVHzX6rWeoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738551059; c=relaxed/simple;
	bh=sX3emVmKbYg3Ru2YUK+m+8QFUdK/P8QTu3RaowF1Z+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PhIvQD9YhR065gBinWOWgUyOf9naozS+vYZoZ8k46RBpIt5b33QlolXqpb6hkB1oj1GYBS5i/wPZL4LAo1gkthCpHSPlVaa2Fvz7QKTFaIpKbRjtqIVahxw9iJSR4A4nzDRL2gAhu6cqNiZQtDFZgUkdYB4oFh1IzdoChhf4QwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvhT+ZH4; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvhT+ZH4"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso6798597a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 18:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738551057; x=1739155857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSeB6FYUW5ok6sT4EnlWImkfqu+4Gq30fGY9HKZXdJA=;
        b=JvhT+ZH4FG9QYOu7ZPl+cAWuxwVhzPLoye6yFvZSORuxrSesdFzF5QhPmPwfiADdHg
         CArIT9UNe1HH003tvzPE2WbhkLMb3HrcKOAtAJn3xAm1dBm3GXJpb8F1SqeLV7b31/S7
         LhtwFNdgWbj8PcwLN5UsjrrXWHVKFA9OhpfanOZ/IfPgQYUTVKzXLk3zr2YnOb3ZLJ9s
         04BMgfImdNk/gsvX6u1ipelqHSSVdiZQlT4lD9S5svyIv0P6xz+9vUMMbuVeSN6cHncn
         9dbCMdMD69rFDnHP2w1hILwXUujbnQMe5YxnfcouYy+e/CXXBOQ15MiOx6YrcxLijzH/
         Btcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738551057; x=1739155857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSeB6FYUW5ok6sT4EnlWImkfqu+4Gq30fGY9HKZXdJA=;
        b=Y1mbZeCvFHJKUbQjINWilUv3ZqTHXoH0DN0sOz2B8skixyIbIzjEnr7DiLkVflye7a
         wMWDKyA61z11kMSZ3y5W6iesZ67+rV7CDfksHMIsHdCrIxijze7VcfBhiCFrih2XlgOS
         jU1YaeC4qp1rAaoNp0V4JV3A0hnHsXLb+5Kauv7p7u57joIYNRbHnf2vLTH2h1+mBJvL
         DUAKedWIQ7JSaes+vohI6n71cOQwee9p3NHEb/gaaWLNMT9YVBZcd1NEC1aA+HACzfFO
         uF9Y3GFIduxCLwfmqminPbbwABB89lU+1H855Zt9c5pYVBisvPp+I5sbLYbgwO+jOnYs
         EmjA==
X-Gm-Message-State: AOJu0YzKshVC2/v2TaTIG9bn5vzUIz/uQINgbdIgpXr/4nokaVjOaXSF
	pNJucPiEMtj9w+YeWw2uyBR/G7x8CJ7gNCIEVXPgvXbMSgjTNcxK
X-Gm-Gg: ASbGncvJHZtQeVyUpp3PqMWN6Ser1krJ/7U4jvHVe5n9W/Lz0QXXqwqYJkVN9/kGh+e
	USQhnObpVPtL/FtUVttVxj+bh/MDGurnOHr451bypw8f02Jh1WHYeyfmGClwKoU7qByC+yS/jxl
	2oK0/Neu5SzEvwINnBInukPwgxD1N9CzwKGEIL2m6B/DxN1ydlNywf/L4K03iqjl0w2/MZ8aoQ+
	BrCMsXhi2EKv65+s7lmIpHQPCc/W+ShN+FL/2XraKfzfkrIue1shbsp8LvQBleEt0qvxgK2bYa7
	WNIfL6Vt3zewquk=
X-Google-Smtp-Source: AGHT+IEm+XYBYNUpKGHxS4iJYNlFNXXXqY4eXL11OV+CK4eNCH5CNZ0exIVXPocfSPFIBr77FrofDw==
X-Received: by 2002:a05:6a00:8d6:b0:729:49a:2da6 with SMTP id d2e1a72fcca58-72fd0bbe0e1mr34833882b3a.3.1738551056820;
        Sun, 02 Feb 2025 18:50:56 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631beecsm7449789b3a.12.2025.02.02.18.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 18:50:56 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id F065F4209E79; Mon, 03 Feb 2025 09:50:53 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
	Petr Mladek <pmladek@suse.com>,
	Wardenjohn <zhangwarden@gmail.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Leonardo Bras <leobras@redhat.com>,
	John Ogness <john.ogness@linutronix.de>,
	Bo Liu <liubo03@inspur.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] kernel: Fix "select" wording on HZ_250 description
Date: Mon,  3 Feb 2025 09:50:00 +0700
Message-ID: <20250203025000.17953-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076; i=bagasdotme@gmail.com; h=from:subject; bh=sX3emVmKbYg3Ru2YUK+m+8QFUdK/P8QTu3RaowF1Z+A=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDOkLtJMn/ChXZNzicz5s5jv1/VXzeM+ox8sEX9zK8un1d 7b4Mw0bOkpZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjARYR5Ghu67Ipt5rmS7KT+N jOwKYtQR/Sa+dfXmsJcCh2VKRUNVzRgZ/r1pmJrMcvbNhCdN+y3apHh5/mfVNDtu1bBN0qlYWa/ FBAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

HZ_250 config description contains alternative choice for NTSC
media users (HZ_300), which is written as "selected 300Hz". This is
incorrect, as it implies that HZ_300 is automatically selected
whereas the user has chosen HZ_250 instead.

Fix the wording to "select 300Hz".

Fixes: 40fcfc87222e ("[PATCH] HZ: 300Hz support")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 kernel/Kconfig.hz | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/Kconfig.hz b/kernel/Kconfig.hz
index 38ef6d06888ef1..ce1435cb08b1ec 100644
--- a/kernel/Kconfig.hz
+++ b/kernel/Kconfig.hz
@@ -30,7 +30,7 @@ choice
 	 250 Hz is a good compromise choice allowing server performance
 	 while also showing good interactive responsiveness even
 	 on SMP and NUMA systems. If you are going to be using NTSC video
-	 or multimedia, selected 300Hz instead.
+	 or multimedia, select 300Hz instead.
 
 	config HZ_300
 		bool "300 HZ"

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
An old man doll... just what I always wanted! - Clara

