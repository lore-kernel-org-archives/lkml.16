Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C362B1DF269
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747477236; cv=none; b=b9HgayBLrLufzKziQCfPOH4peJ8r/+zFxiF2i8MbsRMnBkkE/j+qst22jTboEZJ0krXHiCAKpEXMRlqaCNit3bsogn+PVlMw0MlaSdHramBkoVTxTe0OLeUTEPhbUupWNcLjbAT9b0h/J0YxhRu1jTHvIJUsELaT11jYZTV0uRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747477236; c=relaxed/simple;
	bh=JWODGwLtdv+77yvZZJdsXJ8qFeJKioaZG583PVldo9w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Y6AE+7cpLBq7bdf6ft2irgY+ay10281tHWBKkX9C3gnyaKbSGE6ZEVdfi1JpxnaX/xDOXlMA9rX3huxglv4gA5lavGCdarV9SjnrYuTRXMbzWegu0U0QK+cgEdu8CFp+AK7miVxm74u9Xhnr6VupuNw9zRUf1S4RwYRtPEYYzgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zzzk40Ph1z9sSD;
	Sat, 17 May 2025 11:51:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jyheiksRlMl; Sat, 17 May 2025 11:51:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zzzk36cXFz9sFT;
	Sat, 17 May 2025 11:51:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D9BF88B767;
	Sat, 17 May 2025 11:51:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0xRvE50RE-Xh; Sat, 17 May 2025 11:51:39 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9EA4C8B763;
	Sat, 17 May 2025 11:51:39 +0200 (CEST)
Message-ID: <9e5b3e8e-3280-4ff9-915b-9a8b934bac22@csgroup.eu>
Date: Sat, 17 May 2025 11:51:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [GIT PULL] SOC FSL for 6.16
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Language: fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Please pull the following Freescale Soc Drivers changes for 6.16

Thanks
Christophe

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

   Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

   https://github.com/chleroy/linux.git tags/soc_fsl-6.16-1

for you to fetch changes up to 695d702f42bf4bd335e30f542ca710af081ee2a3:

   soc: fsl: qe: Consolidate chained IRQ handler install/remove 
(2025-05-17 11:01:55 +0200)

----------------------------------------------------------------
FSL SOC Changes for 6.16:
   - Various fixes and cleanups from Ioana on fsl-mc bus driver
   - Other misc fixes on fsl-mc bus driver
   - A build fix on DPAA2 driver
   - Some preparation work from Kees on qbman driver
   - Some cleanup on FSL qe interrupt driver init

----------------------------------------------------------------
Chen Ni (1):
       soc: fsl: qe: Consolidate chained IRQ handler install/remove

Ioana Ciornei (3):
       bus: fsl-mc: fix double-free on mc_dev
       bus: fsl-mc: do not add a device-link for the UAPI used DPMCP device
       bus: fsl-mc: add the dprc_get_mem() command to the whitelist

Kees Cook (1):
       soc: fsl: qbman: Remove const from portal->cgrs allocation type

Krzysztof Kozlowski (1):
       soc: fsl: Do not enable DPAA2_CONSOLE by default during compile 
testing

Laurentiu Tudor (2):
       bus: fsl-mc: drop useless cleanup
       bus: fsl-mc: increase MC_CMD_COMPLETION_TIMEOUT_MS value

Robin Murphy (1):
       bus: fsl_mc: Fix driver_managed_dma check

Thorsten Blum (1):
       bus: fsl-mc: Use strscpy() instead of strscpy_pad()

Wan Junjie (1):
       bus: fsl-mc: fix GET/SET_TAILDROP command ids

  drivers/bus/fsl-mc/dprc-driver.c      |  2 --
  drivers/bus/fsl-mc/dprc.c             |  4 ++--
  drivers/bus/fsl-mc/fsl-mc-allocator.c | 21 ---------------------
  drivers/bus/fsl-mc/fsl-mc-bus.c       | 12 +++++++-----
  drivers/bus/fsl-mc/fsl-mc-private.h   |  2 --
  drivers/bus/fsl-mc/fsl-mc-uapi.c      | 11 +++++++++--
  drivers/bus/fsl-mc/mc-io.c            | 19 +++++++++++++------
  drivers/bus/fsl-mc/mc-sys.c           |  2 +-
  drivers/soc/fsl/Kconfig               |  2 +-
  drivers/soc/fsl/qbman/qman.c          |  2 +-
  drivers/soc/fsl/qe/qe_ic.c            | 10 ++++------
  11 files changed, 38 insertions(+), 49 deletions(-)
