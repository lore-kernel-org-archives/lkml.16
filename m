Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C229B0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743037999; cv=none; b=ToekqaxbNqvQIr0LI7eDwvax+Ytt5C9aL3udqq6AS/dp3c5Jz2tI44U1EznsgIC/fLhSktM+ST+7tUG8uSdC9IXn+Yl9dCDrYcBKE6rwBN1UkciHqG5sUCWNpDwB99PJVQsoS+b3yVMOpWdfVtCKknt0entH1wTgnYdBDXGkmkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743037999; c=relaxed/simple;
	bh=m530oQpdK+bDzh/ln85B/YYzFNCIGLD/ipYtrFtyaAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7esJJR5bJ+26yVOtHKzRgfztaD2ch/MY1/7I6lmoZpL5lJtayhew35U2XrpLu3b44s/+gfdm4MRvYoN9gvPA7UGztJX7MVqHx+UKDm7YVFDY+znGlVRVum77qobCQTausd+WZJnQ245OIT0TDkzUEEL4B4O4NoSjvqc+ePIuBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fy7T0rW2; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fy7T0rW2"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso752958a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 18:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743037994; x=1743642794; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hoHDC3JtUoSlWeOOdPxQY/Nm0XTielw+uZpYtN2LZI=;
        b=fy7T0rW2kDRVjvN/WY0StIV8WXpJz+o91ptIxPCcTM2YnFgyj2YlopsZ7qmJp7SgS1
         mHyKHqv2pBHCgEefsbYUJGqV+M4PLzluwLk+Pnmz8yZQTTNNFCwyBUC4IX7aZtNZJwSY
         +xH9GolFZVnEKmYTIxRZX6gLMN8Sc4u4LpK6kDFTnyXgJgboDOAOEYbyGqVno0l3WBBD
         oEI/BC2Swb6Qrl4nvvkB1n8PxwSo6H6FdKp6GyF4B4GH4Fl6ozbJgOK1Q3rLATrgCxRI
         OBbF1SyHSvhAx293QX8zt2vax7geCQIUD6tB8VYSqYFK9B4fshU7cmCRdb3gGfatcIaP
         9vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743037994; x=1743642794;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7hoHDC3JtUoSlWeOOdPxQY/Nm0XTielw+uZpYtN2LZI=;
        b=nEwQDOoESDfasvZbKjtld6F3qtWDcr2GvXf1/U+PMY8MLzQGrUv6FuLjGj6xmvpzGF
         LrZPl0De7J4LGOC078ZaS9QYuDXuc0dUs93mWDgFxceksQYzIlNwqsJhzT+XvqQyCjTU
         jo6LR+Ri6ETkGQFf8nFlkIy6/EzJ0/LrUyNCgfZ84YGHIL7WB1r6rtu8x0nvUD0hMFFw
         TYCQFo+g5mDWlxsrP0q8G1BoP8tGw1137pUYm7EX+SMvHYwlQS3wFpyiAXBeaRNgahdJ
         1HC/M+d80xZSw3VwJWnoTyVo0/0kNIVO6jsyycgztaFuMITjJ4sIeYV4Dy9TfskFoeYf
         GZRA==
X-Forwarded-Encrypted: i=1; AJvYcCU5K0ltJ37gEB+mF9oWeeRtSiy7VZB/aP8chatAJcYIPUs9DObiDveJd9pA5Peg8+o+ioOJp2ASm8oic90=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVF9RdfK2/h1e+9PkR64iR9T28IfZ0CzTbJnSenaOeLyyqJHI5
	mYfuL9g1PTwkHDpn/yLTwroUWYWmylYEg9QWBdaq54Mr9mh6510i
X-Gm-Gg: ASbGncspnE7IX7Y7LVFIIlr5OP9eseIfQlxug780BdyWbEvonkvSN0A2IsuBSLJPYHd
	6v4bC+ft6LdaAJj5piHOGdKjV5GacNTc8/EZqzCO5cX+vly5igOc6TKRRPiWOF6iUP7D2EEx/Kq
	Y4EfGrGuCd4T9jHlW/HfrmrXCvGwkeqAuKQI+nJZpBxIffRa2CXkW9El78bS0Kxrj3XhRKX4vpo
	Na51qfJUSIK3ZjH+BRA+0zlH7Es0e/fcEgS6K3L/8Ntp5cy2CajuPR9NqP2/WYjb47oKUAleSdo
	Q8vnisryzV7v4pc7PW5B/uxOdwOsSE1KvPF9MdwgBlhp
X-Google-Smtp-Source: AGHT+IHhYdoOv0p7TAjQ0P+GnyHxjE4+7fAF+A6cPdm2gu2day/h3UwvP9oAultJ7bFRvfWvrlTDEg==
X-Received: by 2002:a17:907:9446:b0:ab7:9df1:e562 with SMTP id a640c23a62f3a-ac6fb1444e7mr120774466b.48.1743037993691;
        Wed, 26 Mar 2025 18:13:13 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd78e0csm1133142966b.175.2025.03.26.18.13.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 18:13:13 -0700 (PDT)
Date: Thu, 27 Mar 2025 01:13:12 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 mm_cmdline_setup+0x94 (section: .text.unlikely) -> memblock (section:
 .init.data)
Message-ID: <20250327011312.mj55byrfatiprddh@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <202503241259.kJV3U7Xj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503241259.kJV3U7Xj-lkp@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Mar 24, 2025 at 12:59:00PM +0800, kernel test robot wrote:
>tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>head:   586de92313fcab8ed84ac5f78f4d2aae2db92c59
>commit: 73db3abdca58c8a014ec4c88cf5ef925cbf63669 init/modpost: conditionally check section mismatch to __meminit*

Looks this is not the cause, after reverting this commit it still report
mismatch.

>date:   8 months ago
>config: microblaze-randconfig-r061-20250323 (https://download.01.org/0day-ci/archive/20250324/202503241259.kJV3U7Xj-lkp@intel.com/config)
>compiler: microblaze-linux-gcc (GCC) 10.5.0
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503241259.kJV3U7Xj-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202503241259.kJV3U7Xj-lkp@intel.com/
>
>All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
>>> WARNING: modpost: vmlinux: section mismatch in reference: mm_cmdline_setup+0x94 (section: .text.unlikely) -> memblock (section: .init.data)

The reason for this is gcc put mm_cmdline_setup into .text.unlikely section.
Since it is only used by mmu_init() which is annotated by __init, I think the
proper way is to add __init to mm_cmdline_setup.


diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
index 4520c5741579..e98cfaf1c62b 100644
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -143,7 +143,7 @@ int page_is_ram(unsigned long pfn)
 /*
  * Check for command-line options that affect what MMU_init will do.
  */
-static void mm_cmdline_setup(void)
+static void __init mm_cmdline_setup(void)
 {
 	unsigned long maxmem = 0;
 	char *p = cmd_line;


-- 
Wei Yang
Help you, Help me
