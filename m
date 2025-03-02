Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E091E7C06
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897872; cv=none; b=NOhKNnppW/LJxC6zYABhLs4ODx0RVLM2Q8Mfqj9qLtZEngluODK3kERKmAeOGLr5aHkPA4cSO4RaRLzaFuNFx6wingat2FmcfZxQdJvjw7ZSQj6Fk/AzD4OjoVsTwuDj2ymFv4WS6jkAn7xeOgRQigb04mHAbWptlZf0DbUzzhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897872; c=relaxed/simple;
	bh=UyPD+95nIFiG/gFr2rAqnNWXPHGkDBUZBe3GQzk2iCE=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=nSHaUD3kQETqxoLE23pX9iQn/6kmsnzfJjfccAiShPnegrrnvvqzXL2SGgqcH/V89AM/zLBzdFUlYDh6noj0Mp9n2C+QcUXAFQGmBh7yRUDaVwpJwTsc89v6K8DkuvzaLYNQiKoxGcL3C4m1X1ibzojCPqQUSTbZiwBpfDvG4Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=H/SyEFLD; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="H/SyEFLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=UyPD+95nIFiG/gFr2rAqnNWXPHGkDBUZBe3GQzk2iCE=; b=H/SyEFL
	DhT9nNxULtrIIPmR56GgR/pCbeWh9wPADG96Qaw6m1AL7GkVF750nQ8yqa9jV/qi
	eZzRfFH33dFvpHh4WCUrC7DinL6rQRvj+E+Uy6O8x01wZKeiB6kvDYeXqDFJfvhQ
	XvKYakgQl67TVNl1efwWGnPmidh5iCqFDP1g=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3vxtH_sNnHxsYBw--.57509S2;
	Sun, 02 Mar 2025 14:44:23 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than C++
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3vxtH_sNnHxsYBw--.57509S2
Message-Id:<67C3FE47.06FBDB.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:24 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOgEEumfD7An0AgAAsy

Hello! Rust is better than C++

