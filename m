Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0E654BC6;
	Sun,  1 Jun 2025 22:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748818397; cv=none; b=BYI5xstAd2gLZbW+Hn7tbMzSOLGa3LVk4VnYtZzL6UpdyiKRv3tYrNE1zwRXoURAH06vlH5+6BwMJDT8uHTILKa9RjrgXzWcplFxQ3c4CBWWzzvWcdRybK4+9gAeGIKfugUIgoOTnnLap/wV/aBB5hc0vBY0ONnFisB1NVe+yn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748818397; c=relaxed/simple;
	bh=6B7ojTrk+HfM/GDPnZpaemDeDbUdMUSyW94J63Wet5I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=dKlmA4JHXJ0UEeJWzBbIDEe3P6pe1pNdUcs8izA914OWwIMD7gFRUjoWLyqbqu/W8+tdgei2DCApvrH8ESe5SyjirGXolYmus1KTaCbnwoJ0vzpA+vOftr30pokmz6HkrJ4aTCq2+Mdh4JA98pQubExLq52VzR97NlwQ3zoZyxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB230C4CEE7;
	Sun,  1 Jun 2025 22:53:13 +0000 (UTC)
Message-ID: <992c6488-4089-4e0c-96cf-70e8d18b4986@linux-m68k.org>
Date: Mon, 2 Jun 2025 08:53:11 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v6.16
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the m68knommu git tree changes for v6.16.

A couple of changes for v6.16. Use new GPIO line setting values for
local gpio driver. Make more use of strscpy().

Regards
Greg




The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:
   
   Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:
   
   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v6.16

for you to fetch changes up to eb43efd062d10bacdf6b50df0e300a7049474e51:
   
   m68k: Replace memcpy() + manual NUL-termination with strscpy() (2025-05-19 08:54:30 +1000)

----------------------------------------------------------------
m68knommu: updates and fixes for v6.16

. use new gpio line value settings
. use strscpy() more

----------------------------------------------------------------
Bartosz Golaszewski (1):
       m68k: coldfire: gpio: use new line value setter callbacks

Mohammad Mahdi Anbaraki (1):
       m68k/kernel: replace strncpy() with strscpy()

Thorsten Blum (1):
       m68k: Replace memcpy() + manual NUL-termination with strscpy()
  
  arch/m68k/coldfire/gpio.c   | 8 +++++---
  arch/m68k/kernel/setup_no.c | 3 +--
  arch/m68k/kernel/uboot.c    | 2 +-
  3 files changed, 7 insertions(+), 6 deletions(-)
