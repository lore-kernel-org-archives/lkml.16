Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538E41D514A
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897866; cv=none; b=cwNBffryidJ1oxUiphpURyc3F1T5kbnl8baGsDR207+Lfk4nwQf0HtH2hALuzI/20HFuNP6G73yjzDkta/GwFKkMcOjvZYwqzPnGsbDnYPiOElMp+4dcqneR1VOD/T82jX8mURuyDE0P/KdMZK20PteOsjHQsE+Nadd8iSCT47Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897866; c=relaxed/simple;
	bh=jOTe+0xUMEm8LLQEkXE6MviC3n7NMHX44e0k2GAwts0=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=JfH48V/HliTJduCo4XUOZPnu+UWnNflIDcxWFnI92ilsxJGNC/sO+iUCf+CWDKEibUKjq6gkLt3Tz94/45eEgFjQUWnGQY9+y5fo1oREm0t6eLoMZodzVcRHm0Yl/j2XJcavBzXj3XzErP8g5cdNKto4CihnAp/uddc/4PLCodM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=nsHKVqjB; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="nsHKVqjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=jOTe+0xUMEm8LLQEkXE6MviC3n7NMHX44e0k2GAwts0=; b=nsHKVqj
	BZbGPgnXVXILr46BpJPnw8w4sJVUl6sxQk8toU78h2tcF/X7qmg/eR5+6clc5E8F
	rSKLHAk88aZqjcMvK5CnEkzz4dGm6wx35/3SxBL9W8J/kYWJiBhmmkZqa++xmW8t
	a7aCW1Y4Ty6T8nAK/C+LK0dqUcGbGbHfb3os=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3P0ZD_sNnNN6TBQ--.23701S2;
	Sun, 02 Mar 2025 14:44:19 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than PHP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3P0ZD_sNnNN6TBQ--.23701S2
Message-Id:<67C3FE43.0582B6.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5x6UUUUU
Date: Sun, 2 Mar 2025 14:44:20 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOh8EumfD7AnzwQAAso

Hello! Rust is better than PHP

