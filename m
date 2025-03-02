Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F2E1E98E3
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897874; cv=none; b=skw5txNXUuvg8J/93b9iV0p7IaaJbGcpwISA9Es6kpNe2IW25yeZUlo2o14HiKHuDf7f385jJvQhWyPKiH2sSzhyvaZysK0vYUZARP1r6QdQMXSDAtnmIXPD3IRTiuM1sCSxVovlxK4x2JI6qzOpHr9fhvZMkv25hQln1H/pxzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897874; c=relaxed/simple;
	bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=WfpKt7Nzp5YpNkO8VdtgiUllAeILJx+9bxoQxEUz1bVDgZtE7A6/XnUO4yHSHiBizrkIX2UR+QuD1z4Xp2pZMXIkhtOWO5EiCcU/hmIo+TGB572kH7/2Cmi9AFCWtyRAPI2Bfeciv2g17PlLmE4CWzOHY4Z5wr6BuXrSv0fn8mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=XzKujIE6; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="XzKujIE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=; b=XzKujIE
	6QALzbTShGugRevLMYOvx8jvX/xeAecDsEzm8MfxYzhgM5jrewmtS1+2VmqXHNh8
	ZY5mYmJiLoSQYVVWaVLE5yRgFL7A3OxKDoMW2zRwmfNI6+i3fFF0H1X1Dx4HLnSj
	cHV06FcXrU4TDGUHcUCaO825WGWgsCQhPHak=
Received: from localhost (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCkvCgD39yJJ_sNn7XzdBA--.7372S2;
	Sun, 02 Mar 2025 14:44:25 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than CSS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:PCkvCgD39yJJ_sNn7XzdBA--.7372S2
Message-Id:<67C3FE49.0F01BE.16940@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:25 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifgoEumfD7erZ5wAAsX

Hello! Rust is better than CSS

