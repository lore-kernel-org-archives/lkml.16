Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A8B207E19;
	Thu, 27 Mar 2025 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743076378; cv=none; b=qGngsgEM6wTR1jV6cqgInEHgexygvqjCZw1SXmAnBIKkMgB335Z+Gklv+a1t61Z2RRvhyXSH6YnR3PZRWmnlBIGcU7KzJhBJEzZ5I6JAfKCKh2OhG3UJEvmPn9abVNwaSWBRq2Xl1R1IkSZE4lF9K3iWa5NFu5qZppG5ZwMSvKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743076378; c=relaxed/simple;
	bh=q/+eS0lV2+uoQw6R2o+PvLuP3Cd4G8Ov8M9fLC48ZGM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=QymTzFM3JA9Qx9YB+9znqGnxXgtwW7mZHYRXTCHAwtFr59G/N4R7JALxzTH1ZS0QGfCgKSnpTwUeVXDkRx1lA5bwTilzSB+XkrcWWYVflg/AtCB7qgHUOu4tmElszZxVanZAb5YBVwpvdvvS5jWC7IfcYkJqz+rg96JKAB9AfnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FBF5C4CEDD;
	Thu, 27 Mar 2025 11:52:56 +0000 (UTC)
Message-ID: <85317154-c8a9-432d-b43c-34dc5e511890@linux-m68k.org>
Date: Thu, 27 Mar 2025 21:52:53 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v6.15
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the m68knommu git tree changes for v6.15.

A couple of simple changes for v6.15. One removes unnecessary includes
of linux/fb.h, and the other improves hardening by replacing use of
strncpy() with strscpy().

Regards
Greg





The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:
   
   Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)

are available in the Git repository at:
   
   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v6.15

for you to fetch changes up to a7130910b80753d52ff8a493cf787bd1c9473404:
   
   m68k: mm: Replace deprecated strncpy() with strscpy() (2025-03-17 09:27:59 +1000)

----------------------------------------------------------------
m68knommu: updates and fixes for v6.15

Fixes include:
. remove unused include of linux/fb.h
. use strscpy() instead of strncpy()

----------------------------------------------------------------
Thomas Zimmermann (1):
       m68k: Do not include <linux/fb.h>

Thorsten Blum (1):
       m68k: mm: Replace deprecated strncpy() with strscpy()
  
  arch/m68k/kernel/setup_mm.c | 3 +--
  arch/m68k/kernel/setup_no.c | 1 -
  arch/m68k/kernel/uboot.c    | 1 -
  3 files changed, 1 insertion(+), 4 deletions(-)
