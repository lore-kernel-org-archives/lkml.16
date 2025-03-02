Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6C81EB5E7
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898742; cv=none; b=olaGWLt8AB6xoDSEo8jXQxvEMP77xUTwFOhpC73paC6VTtJ21pYW3BLhDuAFP5Inc1e9++ZVlAW31UicEZXk0ZH8OqvqPoKJiz/gFI7xKXkseR2K3vsamlIF+gJNF2uzGgLJXua5mEEWUoIpMP5UxZZCtuSR4+0nVbfVYCcfBOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898742; c=relaxed/simple;
	bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=Ylaph1UhSzhUAZk5dHm660SV/rCTUO8FlVWUFoFxt5XtH9aaP3wR1tX7GLj6QU/gL5P7JuanUS5gLjEF43Va+rDgpQfbOcrdr2Ut4G/dbrn62srxWWtovIiy1/ddDLcFYp4LIvARAVvftZSNKtvbtBsCu9KYDSlYVTkOdp5eVTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=aqVAgrCJ; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="aqVAgrCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=; b=aqVAgrC
	Jo8kaL+6psh7708X5RmvCRjt6LcGvZUvvA4YX+4MrnrnEBY6Dk+1aQV1javnpRCb
	4ypfW3/3HJ/zcJ4mmnXbQzAuzLZXMh0p+YwvlvDHDF8WDG+u/bo7ZgDqw6PIOHxV
	wQ4JMGGHGrdX/kgm86JZ4HEek1cTJFnLdg+g=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDHT9Mj_sNnHT3eBQ--.41448S2;
	Sun, 02 Mar 2025 14:43:47 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wDHT9Mj_sNnHT3eBQ--.41448S2
Message-Id:<67C3FE23.059B3B.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgbAzUUUUU
Date: Sun, 2 Mar 2025 14:58:55 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOg0EumfD7AnyEQAAsr

Hello! Rust is better than C

