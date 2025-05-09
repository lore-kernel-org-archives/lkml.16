Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6233D233735
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793452; cv=none; b=VSC8J7gPqKxC7B9xrh7/EDacVaj3yQEDJYyMmfQrd13oSum305+gDSfQUNxU4ZUYPoaYhigL+4Hs5df05qSUhOUHl1E+uwOzwCDXBg/mZRJeySDXa4hRNqDrtdbRRaceoheujffx54f5pdsrW4EAXkgaNVrqX72b5ZqLdm7Jjkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793452; c=relaxed/simple;
	bh=XxHJu+DIj0W7RnUXdPtqn5tPMuFvSZk4Ubf2y9np14w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J8M6TYOMeu5BLqUki4DGX93pytkNqQ8LYiN3SmY10/+DLkJzhkNFhgSX6VPPbUdnbB6hMYtemVPNQyXKT0mWRm5H/SD2J5E+PNlI7TemQnv3SwE9H+6seKrNgpHwnZQuGgMkXXJ68NT/J5nuKGbDVKBw4hnaMM7CYtL/Wk5Erxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AlrosX6/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AlrosX6/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E41C4CEE4;
	Fri,  9 May 2025 12:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746793451;
	bh=XxHJu+DIj0W7RnUXdPtqn5tPMuFvSZk4Ubf2y9np14w=;
	h=From:To:Cc:Subject:Date:From;
	b=AlrosX6/+kZbkPUpwXqupd0O83RfpxIo5EAlMTwOfkX/AceeAaQKrxep0X7dF0o95
	 C3dtw0fZf99aBT8a+4EmWxaET4WZ1Guf69abPSoRRb9axTrr5/mrtv4yl2YBfSYvYc
	 wELM5FvFCiAGRmKBY1S5P913uzWnb8BBD8t7BdVaAAWNTwVWwCEmJ6Ko9fTfMyYYdB
	 oqfMxuABtvcl2a+HPnSGAwAKUU2r3j60xI/tWoJaSERxaZGQ2mjyCKXWtKs3ajEXnh
	 78zrR9fCUTNVwpPkzWbZikE/qYmI4n8CMhzHdlDLwkB6HJRw1oxVog3w+GJc+wgitx
	 Zfg5B1ojM7cgA==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 0/2] nvmem: fixes for 6.15
Date: Fri,  9 May 2025 13:24:05 +0100
Message-ID: <20250509122407.11763-1-srini@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srini@kernel.org>

Hi Greg, 

Here are two fixes in nvmem for 6.15, Could you please queue
these for next possible rc.

fixes include
	- a fix in zynqmp_nvmem provider during cleanup.
	- fix a link failure due to newly added crc checking 


Thanks,
Srini

Arnd Bergmann (1):
  nvmem: rmem: select CONFIG_CRC32

Peter Korsgaard (1):
  nvmem: zynqmp_nvmem: unbreak driver after cleanup

 drivers/nvmem/Kconfig        | 1 +
 drivers/nvmem/zynqmp_nvmem.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0

