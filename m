Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A681D5CF5
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897872; cv=none; b=XWJ5T7SBVgPdZrnR2JOSJUiPi84l1P6/7KQmGaH+To/fws6v2spfy6MURdzXC2OgVs6OA/n5eUelFFKuyoBSuxrEVDyMCxcmhuIRG0jeIXYR5arHgZdPynFAFhUqCLHg16y7qtmGoki9UaeYRY0kTWrZzfWrlRpNMuYmtLAJpEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897872; c=relaxed/simple;
	bh=m3WWx7WaxOLxHF4l3ehA7ZpOfcH46DacagbXvgNtOUU=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=Jy++/5JgSgw1IjpJ2RqmiHZh2baUxbqHL7dn7fMXvY6bgHhTrXz078e4vIkA1iYUq7HPxc+eWu6ncyD/DbagfuVUXEDT+EXaojJEcb4hAsmq/kecrgRStDGZD+GkPeqvVqwsSj5kuWlRMdgrYA2vO9P5WqF7ckbCehbPoLgs5O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=E4Qc97Sa; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="E4Qc97Sa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=m3WWx7WaxOLxHF4l3ehA7ZpOfcH46DacagbXvgNtOUU=; b=E4Qc97S
	aE5UI4w5mWr8ElUqaX7CsJYU51Gu9RcccMcbMTZxSWlestLWuAnVWGOmTXRs1gLR
	u0kjIv/3Of+tJzedVsJA4fMghS4A6S0m2QekmNVZPtROfTNTXzvvlNw+cXXZgyxg
	pSZTdDgyU1kKK1PlyPNKyaIBjUbzUAticRtw=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDXv9BG_sNnKp67Bg--.58488S2;
	Sun, 02 Mar 2025 14:44:22 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Golang
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wDXv9BG_sNnKp67Bg--.58488S2
Message-Id:<67C3FE46.07045F.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:23 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifgoEumfD7erZxgAAs2

Hello! Rust is better than Golang

