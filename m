Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E2F1D86C3
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897870; cv=none; b=Z7stWmWPOzDqMeHQJTVsza+EccyE44vdCBx0tbfVTQFJQQnu549NEVJ9FsB92UyG1OtKEZzl2CAaRxj3P3OyXPBKx6XrjUAC14YOD4/Y7h0o5YCD+K2JnrK0luX/Sajr6ZUEKnNStswwVKSI3EEJIpvXv3oQNrf3mkYqu+TuOvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897870; c=relaxed/simple;
	bh=PchpREbeVuSu33VarUHMnUKVR1nscKOKnSIs1Y8iilo=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=mzX+YZ23PlO8dzNnktJXqf/wRvxPFJ3q52cK0D6twf9fCXbgVR8EfCixw+cRA9C+c9PGKGZFPQB0uoVJ5KrO09k/EpfqJdF05477LOqC1sxRkT/ToCyHGHdyl1MGJp3TOzl2jGDWkcemqjRUNcTkFk+lGp1wlZQKhEIXwjknLXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=AQsUqJ32; arc=none smtp.client-ip=220.197.31.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="AQsUqJ32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=PchpREbeVuSu33VarUHMnUKVR1nscKOKnSIs1Y8iilo=; b=AQsUqJ3
	2jsr8WhvGei8rPlSKIDe4l8oaPgUBoW4L8BQISDTjRViLiXUDWsawnbEWUZrRztu
	8h1snZrPk7QzwIEJDwcwOHrN52AFLzoF9GcxDhU3Tv67EAv6aGobv3u/ujhltAhV
	HnDrQyYhiwGq9mYWZAbE5F9og6MUrpZEyt+M=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3l1BH_sNns9MgBg--.41010S2;
	Sun, 02 Mar 2025 14:44:24 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Javascript
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3l1BH_sNns9MgBg--.41010S2
Message-Id:<67C3FE48.066DCC.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:24 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOgUEumfD7An0AwACs1

Hello! Rust is better than Javascript

