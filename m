Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85361F3B91
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918662; cv=none; b=QIGusnkfMi1BqN7cTO8B6cEVX3dRKbU5iN6hjddQWpDpvYUoBpaOd808wsTHSEAucElYOhbs+mkRF4KjOHhf9S/CO6pdc9Qir6b80lzm8PLeBoJPGxdnZa2Q2DDOhn7v2Wf+kt8ITX5ue11Ps5Xe3jKDVP+MzewNnFEgsPMT+9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918662; c=relaxed/simple;
	bh=o1csKc9ZVFVsUlIFm6HWUnnywS98+4SXNnSzujgjaKc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LN4VXph3TJsa5m9qEHRmsUuvA6Q3EVT3E6C/L5oo+n8rLAZP4KuXulaw94Vmry0KKHPOAzKnMpbULVh8DMoQav+M0iV51SOO/8TQhr1oYSOq/f427UwFmmwJ26+mtrGMHbRGMdK5ueO8eO7vxX1DrMuwhwdG37/LIjiwFgS+1pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WTC7v3Tz; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WTC7v3Tz"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A73F21FCE8;
	Tue, 29 Apr 2025 09:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iwqF6BF29WKxLPB1mnKIBn54GPZ4UWzMpcM2FejtGJM=;
	b=WTC7v3TzH+Hqsh3zNVdkJXyioJYWcM0kodb6Xi12W2MXkTwOyWaeG2sLQaTbGLijNkZH+R
	qcwc378/lT1QQ3hOjUtjurs5Q44/p7f+nF53q4uawPwLZ9GtkRdEwh5cismVrGEGwTvGg3
	GfyuLD1EaMoh3fpRBZwuaQHqhxzNWf2QAz6sqROvLEGTyFTmygIiACtRHotipsatSv2on9
	L69y8rZkg1Cem/G8fYuJmWeLPZZiXRK2zrlQGuG1sbfPSazLXIxVyCdXQXZvxkdBj7EXsj
	LUH9hqxrqEkxHfIXHl9EsZJ6DaUmeZf5UPBu/KyXTEvOGrkIwbitjWBV4NlTUQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Chen Ridong <chenridong@huawei.com>, 
 Philipp Stanner <phasta@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250417093428.28571-2-phasta@kernel.org>
References: <20250417093428.28571-2-phasta@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: Use non-hybrid PCI devres API
Message-Id: <174591865790.993381.15992314896975862083.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:24:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledvrddukeegrddutdekrddvheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvheehpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheptghhvghnrhhiughonhhgsehhuhgrfigvihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepphhhrghsthgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhto
 heplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

On Thu, 17 Apr 2025 11:34:29 +0200, Philipp Stanner wrote:
> denali_pci.c enables a PCI device with pcim_enable_device(). This,
> implicitly, switches the function pci_request_regions() into managed
> mode, where it becomes a devres function.
> 
> The PCI subsystem wants to remove this hybrid nature from its
> interfaces. To do so, users of the aforementioned combination of
> functions must be ported to non-hybrid functions.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: Use non-hybrid PCI devres API
      commit: 529cbc9c648904e9bf07f3485a34d6e1cd3091a7

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

