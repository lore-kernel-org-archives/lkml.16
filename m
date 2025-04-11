Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654C427CCDC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369012; cv=none; b=h5Ma3zaqJoEnYOhFYJ4ypZY2eg0SvDx6J6er9355JFsCqnmDiFzTCJfQIDCWtFK2qrPFeRtS4sAgwKXQ8mEHbELeA+GL1yhgvPX0mfrDqZy3AO9NqUjY6uiEmJ0s/mfoO0RjHoVV5DBnZd295Yvn34JtWUbdmglLrtnuZPwI02Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369012; c=relaxed/simple;
	bh=imz+mPlPTWUBDMx7bzEysHcUpw0o89634fVFDMMMBsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYBBWckVaneIAn14/U60gInvG94JmnNZQQIcz/jJ6lKgqtmcWolYy+CTCWS/kupwm1iRZcKhjgI4gggEQ7CMs91OBosP4cSOTxiWXKQVv8LHQQxkzhRzPXFyNVLfZUid2osFzWO0YY1sgnaH4+12gYdFpkyRnWygq8RMKxcozg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=jaTfAY82; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="jaTfAY82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744368948;
	bh=9KRkDEvc7TMn+BzX0T9birIBPHV4NaWt5YIRVjgsZSM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=jaTfAY82zKF05cJhA/t38WygfLp5pfHoISMaJX8ueIT4QYhyB9y9aOpjiDbb6BiWB
	 p6SUWwCmyfGXH9bB0UztDDXw/u8MLLLbIU9PRgzA5dPjeoa/toWypZF3azpreLv/9x
	 P5rAKl8JBPX0/o8PiNm7hLBks+K2DpuaKUBj8JYs=
X-QQ-mid: bizesmtp23t1744368921ta5c660c
X-QQ-Originating-IP: y6XDffOa9VCdiTTbmBMiGZAntBVmbLMe7C7tY/zlyb4=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Apr 2025 18:55:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5873114534741564998
EX-QQ-RecipientCnt: 8
From: Chen Linxuan <chenlinxuan@uniontech.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Winston Wen <wentao@uniontech.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/7] nvme: add __always_inline for nvme_pci_npages_prp
Date: Fri, 11 Apr 2025 18:54:49 +0800
Message-ID: <8E10021DAFBE47B5+20250411105459.90782-1-chenlinxuan@uniontech.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: Nwz8Cs33/LprLV9bzlLg9s//LwPGS6Z5d8wITrM/fnWYKm1JiyeWpte9
	R+4nR/zTYMTDtUIawaFd/hYaCWmNr60mgGOl5flw88iGgQQ++zHR4VV3KCksyAGP5eRfICU
	0KcqVuh6mjujOF0KhblmEKnHe7Dd1BtXG5DKqKUK2Ia40UQhPo9kasruuoiWK7hw9AictLj
	VqE6z8bsDdMqyJZhfuLMJOmKaBHduD76LjaN4peuQ607kww60cksjipgHDN/Hf6QTkG+Yjo
	xyCji8GmZttpQpJJN/h06J2VcnQT+qZ5ma70iNZeMNy0dCiRODshoMoFkaEbA4nWGaKy2qY
	4uaEQWmTLbI9bmDLeWIGv/9ENGdE4MQxrRi15cKGEka1oV6xUBxsPPlgAWQW+vgwNinbALN
	0v4DOiERlKCJbUMTae6tkS3UNU2uJvRck6X0DNIW9nmt1aMbYyjM+aK5Bh6ocKaFMZEOwLW
	3uXcWeNpuX179+rXmijKuv+z8uj/9Qb5XZSzW946ryYELgqCnjZeTyh8TSX1s8kvuASlCmh
	/JdJef67LyTSg7/DQVLiUrOC2lNZkLe0WAyq6m5sStYrwoWsdbHI8aAgWzO3I+OfXovyfI8
	Wh3WkXLsO34bTPKLK1B7K6RO1owUMgGK2fhg7AMlOGSXTDph+Vg0aORI6a3EdYx/01d0asx
	CGImwnME0NSEgs6u9GWezsFDBYE/Syk0+TaE/20pjfFJuEk7DRuk+868DQLFvOdwfZ7jRjl
	Qad4VKfBXZwxF5d5T+hLWvuIDZOoqc7wUl/ZmXiZl4FK3S6/mx1LavyndYIMutw/BQIezVb
	OKkvAhIakIjDPlI9zDwrJszghKpiqR4MpPIw+TcMojaXMYH/ftBJEOBt2LCCG4CjtDUnvyR
	QO+eyRCsuN+mwYZaRtP+RSefvBaIoKukBT0lxRc9F729/s/6fq9d/3+vGgJ9gWk9sa2TkhC
	8KcjjOawrus2Qghj3eyKh0qVVDpnqmiznIz2skGBGPcEOJjZGOxeLhL8+3yyPyOXtq1nP9G
	+seejhp3p58s5WFX5b
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

From: Winston Wen <wentao@uniontech.com>

On x86_64 with gcc version 13.3.0, I build drivers/nvme/host/pci.c
with:

  make defconfig
  ./scripts/kconfig/merge_config.sh .config <(
    echo CONFIG_BLK_DEV_NVME=m
  )
  make KCFLAGS="-fno-inline-small-functions -fno-inline-functions-called-once" \
    drivers/nvme/host/pci.o

Then I get a compile error:

    CALL    scripts/checksyscalls.sh
    DESCEND objtool
    INSTALL libsubcmd_headers
    CC      drivers/nvme/host/pci.o
  In file included from <command-line>:
  drivers/nvme/host/pci.c: In function 'nvme_init':
  ././include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_878' declared with attribute error: BUILD_BUG_ON failed: nvme_pci_npages_prp() > NVME_MAX_NR_ALLOCATIONS
    557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        |                                             ^
  ././include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
    538 |                         prefix ## suffix();                             \
        |                         ^~~~~~
  ././include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
    557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        |         ^~~~~~~~~~~~~~~~~~~
  ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
     39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
        |                                     ^~~~~~~~~~~~~~~~~~
  ./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
        |         ^~~~~~~~~~~~~~~~
  drivers/nvme/host/pci.c:3804:9: note: in expansion of macro 'BUILD_BUG_ON'
   3804 |         BUILD_BUG_ON(nvme_pci_npages_prp() > NVME_MAX_NR_ALLOCATIONS);
        |         ^~~~~~~~~~~~

Signed-off-by: Winston Wen <wentao@uniontech.com>
Co-Developed-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
---
 drivers/nvme/host/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index b178d52eac1b..9ab070a9f037 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -390,7 +390,7 @@ static bool nvme_dbbuf_update_and_check_event(u16 value, __le32 *dbbuf_db,
  * as it only leads to a small amount of wasted memory for the lifetime of
  * the I/O.
  */
-static int nvme_pci_npages_prp(void)
+static __always_inline int nvme_pci_npages_prp(void)
 {
 	unsigned max_bytes = (NVME_MAX_KB_SZ * 1024) + NVME_CTRL_PAGE_SIZE;
 	unsigned nprps = DIV_ROUND_UP(max_bytes, NVME_CTRL_PAGE_SIZE);
-- 
2.48.1

