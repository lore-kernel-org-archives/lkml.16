Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F181EB191
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939590; cv=none; b=n3f/iIWHSOps5l0VeF2tLtSwxXnMLdvmqnUWglpgLYgRhN7t2bXdehc1P9ii4teXDRG6EGK6sxVC1PiW4u6/thvoyrS1NQ2NN/rNgiV/uBC/4jodKnyZXNmrB4ijxr+3+xuyLKXk8Moc2ZCjzaTZtW9HjGQTsEQaq5XBgli9t+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939590; c=relaxed/simple;
	bh=M9q3u0+HRQMXw8svqoafAM0/nSwqqqdOR5EW9LVB0cI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FI0vFvLgC2bvB/9+mXXLnQExzocIUzDu/91kAkTyg2dj16tYAjs+ijsGER5Tx9e3VTerIMEQjiXgMJ+pVdG42TAQyt02EWa3uqX61cqQLqIe9o2OS83T8UUpSxIkfJ2WUxDm4CSFWoqTjbAQkjCkkyUUvzcGxWWRFW4mUqF1uNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BltvHSjv; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BltvHSjv"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 930494441C;
	Fri,  7 Feb 2025 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738939586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2IJtGFPULPpR5EW3kSBevdNRFYGACBrlSgd0kID7CBc=;
	b=BltvHSjv3EB+ep5vcpHgxweAeNNwN7i4oPyXf9Q5XXxC30PsEwjSpgezd+HiiM4sGTO3SE
	h1nBzz1aVLxgZa/6UtSIlDEngWjsADcCIUmVgXOHixEc2UiSLdY5H51U0rvjdk156ocrjy
	nxy13esdjP3BwewhD4WLGEYvVNQSNrsDtAd2CxLkuPgtdZvVMawJTfQYLVImP37cef+uQK
	93uQ0GYzjYwxkWgs0atYhpkoJj8F8PmRt3H5C9A9gIbDUyMZBJ8Mnh84YVMgOMI0bWlxyk
	nNioXfacgbERUePmdOeVM7NU/CQbOvcGKb7zzxfIIVJZELfrlVKdEFXolbdC6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Edward Adam Davis <eadavis@qq.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 richard@nod.at, syzkaller-bugs@googlegroups.com, vigneshr@ti.com
In-Reply-To: <tencent_78F778176466C7F364036D096B03A8E44F05@qq.com>
References: <87ikpn57sy.fsf@bootlin.com>
 <tencent_78F778176466C7F364036D096B03A8E44F05@qq.com>
Subject: Re: [PATCH V2] mtd: capture device name setting failure when
 adding mtd
Message-Id: <173893958654.2918383.13397786440999528769.b4-ty@bootlin.com>
Date: Fri, 07 Feb 2025 15:46:26 +0100
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshihiihkrghllhgvrhdqsghughhssehgohhoghhlvghgrhhouhhpshdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepvggruggrvhhishesqhhqrdgtohhmpdhrt
 ghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

On Fri, 07 Feb 2025 20:10:35 +0800, Edward Adam Davis wrote:
> syzbot reported a WARNING in release_mtd_partition. [1]
> 
> The reproducer uses "/proc/thread-self/fail-nth" to trigger the failure
> of memory allocation when executing dev_set_name() in add_mtd_device(),
> which eventually causes device_register() to fail because the device name
> is not set, and finally triggers a warning in put_device().
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: capture device name setting failure when adding mtd
      commit: 3f930a52d7151addefa6d5ba9f7f2c17dc52db1d

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

