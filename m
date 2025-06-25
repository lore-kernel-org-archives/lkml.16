Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931DD20C00B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861653; cv=none; b=sbwhLhxzuunhZpRJ6dgNvHsx7U56lY8/SxkELP4QsM8DbmspyLxpt24v+1BdfhT/R6lLqMdAjwrar+GnrvhD+uNGaThPK7rt+um2FHbuGKeINtTA9MVWbHpmKS1fOF4GmjIVdz4HhVpo5RB6JwO5ZeIoF4OVDE4mHTf4TifDQ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861653; c=relaxed/simple;
	bh=1aQdPCSK/iMrYq3lMACmqItfXwpA0hwA0F4iHTJ2uyE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LwK5B8mVP9S7PCPUu+rMsAGvG6N/eIBxsdg8itj68SkvmbeMeYOg2xYxuAFVM6ALh9NZi1cVGe7idEVEvVg9NB7eftksXSf3eipEODdOcxMUTc7NhozSZ4VZ3pqqCqCnD2OPhNHmwpDiEYyUR41wfO11kLIaDiQM4zZPwot/IC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2C18106F;
	Wed, 25 Jun 2025 07:27:13 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E8823F66E;
	Wed, 25 Jun 2025 07:27:30 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	Chao Gao <chao.gao@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Salman Nabi <salman.nabi@arm.com>
Subject: [RFC PATCH 0/1] Arm Live Firmware activation support
Date: Wed, 25 Jun 2025 15:27:21 +0100
Message-Id: <20250625142722.1911172-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

(please feel free to add people interested on this from the x86 side
as you see fit)

this is a proposal for a driver for the Arm Live Firmware Activation (LFA)
specification[1]. LFA provides an interface to allow "activating" firmware
updates without a reboot.
In contrast to Intel's TDX [2] approach (which seems only concerned about
some confidential computing related firmware blob), and even OCP's
"impactless" updates[3], the Arm approach just lists a number of
"activatable" firmware images, and does not limit their scope. In
particular those updates can (and will) be for firmware bits used by the
application processors (which OCP seems to rule out), including runtime
secure firmware (TF-A/BL31), confidential compute firmware, and
potentially even UEFI runtime firmware.
Initially we have the whole chain demoing the Arm Confidential Computing
firmware (RMM) update, which is conceptually the same as Intel's TDX
proposal.

So our design approach is to create a directory under /sys/firmware, and
just list all images there, as directories named by their GUID.
Then the properties of each image can be queried and the activation
triggered by the sysfs files inside each directory. For details see the
commit message of the patch.
This is admittedly a somewhat raw interface, though even in that form
it's good enough for testing. Eventually I would expect some fwupd
plugin to wrap this nicely for any admins or end users.

The purpose of this RFC is to get some feedback on the feasibility of
this interface, and to understand how this would relate to the other two
approaches (TDX + OCP "impactless" updates).

- Are GUID named directories under /sys/firmware/lfa a good idea?
- Shall all three approaches be unified under a common kernel/userland
  sysfs interface? Or can we live with separate interfaces, given the
  different scopes, and unify this in userland, for instance via fwupd
  plugins?

Thanks,
Andre

[1] https://developer.arm.com/documentation/den0147/latest/
[2] https://lore.kernel.org/all/20250523095322.88774-1-chao.gao@intel.com/
[3] https://www.opencompute.org/documents/hyperscale-cpu-impactless-firmware-updates-requirements-specification-v0-5-2025-05-22-pdf

Salman Nabi (1):
  firmware: smccc: Add support for Live Firmware Activation (LFA)

 drivers/firmware/smccc/Kconfig  |   7 +
 drivers/firmware/smccc/Makefile |   1 +
 drivers/firmware/smccc/lfa_fw.c | 411 ++++++++++++++++++++++++++++++++
 3 files changed, 419 insertions(+)
 create mode 100644 drivers/firmware/smccc/lfa_fw.c

-- 
2.25.1

