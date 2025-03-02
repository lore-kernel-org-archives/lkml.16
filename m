Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1451EDA1C
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898741; cv=none; b=kRXBZmm4cl2wjbuxEVZ6AqR3OejElgmkWQJBQDBZ5mF2F2zaBi/un9MdnRzOtAurIOkqgtBDr3n2EkBR/ysFjQF67zL1sbqCwDqxDgN9KVP5fqnBlbsFpbcMx8sPzQhrdMB4hgx7SpgbWetPI0NSu2Ny0G5SYY4Efz54GUqGzEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898741; c=relaxed/simple;
	bh=ImIq5E+yzSMuk5VQu4015FnEeU4ZkIfZhZtOrHrX2Ew=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=Urn1oVfnVUUc7M+RM4mvW0cJosXxrW133wAMXTOqUx5ZxuvsQTfrwffRyK4Mu368mZ54vzc4gBfUcZxNhwleWH2pXIs9RzFv8odhtP0vginJjfmx1Xv3AYqsO5D9yRqtyeN05MhLeIkfXM353EcbL7+6SC939m38ZJXGIRLoTu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=ChmVrXMr; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="ChmVrXMr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=ImIq5E+yzSMuk5VQu4015FnEeU4ZkIfZhZtOrHrX2Ew=; b=ChmVrXM
	rjLkPO3D9c+qCP3oLn/egYXQ1shWrHft1g+jmasduRyfp1BWDvMOV+/SYQnx70VL
	UQFQ+i+WcNcV+eHEsuMxgbNpj1R6pPRcwzr4HQffABAuHSyDKjO6rdEqIzsUJrlt
	dmfVmLBR2QC5mguP5Y6Oi1ighUBPOD828f5w=
Received: from localhost (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCkvCgD31w8i_sNnHs_rBQ--.50457S2;
	Sun, 02 Mar 2025 14:43:47 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Typescript
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:QCkvCgD31w8i_sNnHs_rBQ--.50457S2
Message-Id:<67C3FE23.0D7540.03778@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5fHDUUUU
Date: Sun, 2 Mar 2025 14:58:55 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOhIEumfD7AnyAgAAsn

Hello! Rust is better than Typescript

