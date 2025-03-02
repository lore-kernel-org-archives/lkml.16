Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011E41EE03B
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898746; cv=none; b=cOjKFHipxW++LhIwkX781o4kImKMwYPu0tR9Z2rVgZsOX748zEIFBvcGqmH6vcZmtTvVsgP4iv6DGpocdXr1/U2XW8GGyaqHMzkOIr2Le2kTAIlDO0/zD+z2GB4jMFYTyzDdObTQYd2A3VDup8zdJygzNtlgF1/p0xPi/bmx/2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898746; c=relaxed/simple;
	bh=kuanHuw9J0++yX2NZUc3mDyVR4V4BIDbLbg7VpSpL+4=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=bldh9iny0ElNzmq+RnUPJ6uk7BPw4NwNW3QQlLk9TShwmLxLMRy9ITb+mv/cSVa/X65HJZE7QtvIRUxTgH3GNcTrEo8fmxwLrwns6r71VhQtz+A96tnPct32WRlCPD/j4W5CzRVqohSebzRtri881xjIC0HnsbVcvUgObMY5X9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=njwYWwmC; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="njwYWwmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=kuanHuw9J0++yX2NZUc3mDyVR4V4BIDbLbg7VpSpL+4=; b=njwYWwm
	CY5DxdxUIfTFAe5+HD2BBrgJSmVqUBaeqKr4NFuPxHe+eoxM90bgYl1Y+HzhaSx3
	S/Bsgg9AvyN+Up3j9GS3thBKsdr5bOBYvI5SoU2SyWy0cQFMutX7FEfkcVzwm4K/
	j14Z11oZG3EuL506+NPmTI/QWu7BsUbPGAoE=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnV2If_sNn8BMYBw--.49878S2;
	Sun, 02 Mar 2025 14:43:43 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Cuda
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wDnV2If_sNn8BMYBw--.49878S2
Message-Id:<67C3FE1F.06FBD5.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUTo7KDUUUU
Date: Sun, 2 Mar 2025 14:58:57 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOh8EumfD7AnxuAABsS

Hello! Rust is better than Cuda

