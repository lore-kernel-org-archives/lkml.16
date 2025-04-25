Received: from cloudserver094114.home.pl (cloudserver094114.home.pl [79.96.170.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D37229B18;
	Fri, 25 Apr 2025 19:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.96.170.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609671; cv=none; b=X/9HyApINxsRp2XYzkSMZ2dIq0k+dNmS7cTDO+yPIjgBhxXFqwwnbMD8Hf2KZLA6Uv3OVCAEWAEs4e4mPPsUzn6xP2SVIw6LetYXy82udlU15XYy56ZjWHmtjKAnbGPLwEscjvSuzf7NBdMD0fs9hihMKfJbGlD/JgyNwO9iEY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609671; c=relaxed/simple;
	bh=CM+PKNzTMrafg/UMGmEjcfBGyKKh3b/TNN6P0Wd5yfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hHVIomKccKUxzw5KhBQce0Rwg/MHBdoiJ1PqovRguGWVM5onKZtoODFXst6ueHYh2qg70KyK2t4d+suoven4vosIIw0xEyVKm3v8MNjOU/DhzNiLgI5vl1gILqR8eFax/xQok6VVy0IqIxtkh4Xs8jmjMmowys2ozW1v2w/bGBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net; spf=pass smtp.mailfrom=rjwysocki.net; dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b=rh8qo9ii; arc=none smtp.client-ip=79.96.170.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rjwysocki.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b="rh8qo9ii"
Received: from kreacher.localnet (unknown [217.114.34.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by cloudserver094114.home.pl (Postfix) with ESMTPSA id AC69A664659;
	Fri, 25 Apr 2025 21:34:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rjwysocki.net;
	s=dkim; t=1745609668;
	bh=CM+PKNzTMrafg/UMGmEjcfBGyKKh3b/TNN6P0Wd5yfA=;
	h=From:Subject:Date;
	b=rh8qo9ii/BVX8HAFIyckd58SM+AxfjSk0e7CIXHcAhvVOAqZFtRT760GF9I2TF75v
	 /nFJV5Cy5o2i4djycniRY+STcpdG40dl8sNY1I8WEAkV+I89rn4mq8Qtje4ZHK+qad
	 /S9czj5WO1nwOZhR7bnybvUvBmrzftNHgl9DZqKqB0pZcZ7geZddI78w63dBEEPdT4
	 09W5xWF3HXNIipVslqckHDtLWdAl9XMcuh3SxzGUPKvwXNmudWJvJyw3UBf7y94C/a
	 RVYKkH0unVU0JJRQJwm63fouLQ1+K/mAjLGLcv8tO7pCsnmUJZP1gODnIlFKuh0xp5
	 TlgCFLECkTnHw==
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Bob Moore <robert.moore@intel.com>,
 Saket Dumbre <saket.dumbre@intel.com>
Subject: [PATCH v1 00/19] ACPICA: ACPICA 20250404
Date: Fri, 25 Apr 2025 21:19:35 +0200
Message-ID: <12671029.O9o76ZdvQC@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 217.114.34.19
X-CLIENT-HOSTNAME: 217.114.34.19
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheefudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgggfgtsehtufertddttdejnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepffffffekgfehheffleetieevfeefvefhleetjedvvdeijeejledvieehueevueffnecukfhppedvudejrdduudegrdefgedrudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddujedruddugedrfeegrdduledphhgvlhhopehkrhgvrggthhgvrhdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhjfiesrhhjfiihshhotghkihdrnhgvthdpnhgspghrtghpthhtohepgedprhgtphhtthhopehlihhnuhigqdgrtghpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgsvghrthdrmhhoohhrvgesihhnthgvlhdrtghomhdprhgtphhtthhopehsrghkvghtrdguuhhmsghrvgesihhnthgvlhdrtghomh
X-DCC--Metrics: v370.home.net.pl 1024; Body=4 Fuz1=4 Fuz2=4

Hi All,

This series of patches represents upstream ACPICA changes made between
the 20241212 release and the 20250404 release that have not been included
into the Linux source code yet.

It contains the following material:

Ahmed Salem (3):
      ACPICA: Avoid sequence overread in call to strncmp()
      ACPICA: Apply ACPI_NONSTRING in more places
      ACPICA: Replace strncpy() with memcpy()

Alexey Neyman (1):
      ACPICA: Interpret SIDP structures in DMAR

Colin Ian King (1):
      ACPICA: Utilities: Fix spelling mistake "Incremement" -> "Increment"

Kees Cook (2):
      ACPICA: Introduce ACPI_NONSTRING
      ACPICA: Apply ACPI_NONSTRING

Saket Dumbre (2):
      ACPICA: Update copyright year
      ACPICA: Logfile: Changes for version 20250404

Shiju Jose (1):
      ACPICA: actbl2.h: ACPI 6.5: RAS2: Rename structure and field names of the RAS2 table

Sudeep Holla (1):
      ACPICA: Drop stale comment about the header file content

Sunil V L (1):
      ACPICA: actbl2: Add definitions for RIMT

Tamir Duberstein (1):
      ACPICA: Apply pack(1) to union aml_resource

Tony Luck (5):
      ACPICA: infrastructure: Add new header and ACPI_DMT_BUF26 types
      ACPICA: actbl2.h: MRRM: Add typedef and other definitions
      ACPICA: MRRM: Some cleanups
      ACPICA: infrastructure: Add new DMT_BUF types and shorten a long name
      ACPICA: actbl2.h: ERDT: Add typedef and other definitions

Zhe Qiao (1):
      ACPICA: Adjust the position of code lines

gldrk (1):
      ACPICA: utilities: Fix overflow check in vsnprintf()

Thanks!



