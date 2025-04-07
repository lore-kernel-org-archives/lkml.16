Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B761D209F45
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 22:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744065447; cv=none; b=lWMqGjQ5z9C+Zxrks/KJK+AxnFTO2Os8rOxnJN5ZuWeyP7My9ItGLW9IIZa3DOAhOIOp6/Q5j9tEAb7R3KEy1ZG3dtJ3Aq3HyekBhWdIQN1SITOBg29DesuZQXKvH8r1Qj2qhcJupwT40bHkC5mpxzd4IqX2Z69NEzvfU5mEiGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744065447; c=relaxed/simple;
	bh=g3kM2sk7bhM7/LZ5IEtcQj2u79TaXkp2NNHs8yaghh8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ipLZ2fUXEQQC/poXHBAB/2ItbBuh0mzG+nUySDT9bAXuoK19Jli/OInzraqN5JR9v6ZOSgoWK6JgHJ+unoYzZsg7wr6QW5kJzDBnznSU431zfR1YDyRFVK/r9gb7tHiNnncJ3hGIKIJqFvm2X9v+JOSX3YiXxJTpQD1j9RZcL1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WuMIXXzp; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WuMIXXzp"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744065440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WbBi/k1LpyYTmKsMc4bd6oqOgSUW7H+lQhYQZOWo1UY=;
	b=WuMIXXzp6/g2+o0+VUlNdmJx6a6lLtFCWSyq1co3Y1h6KZQNBMFfDpUrIxkw7RHClHxMqQ
	CcAhk/vOayRmjiLYFcSwqRfVpOZQNUghn1MjCYGXHolsRBLdori2kif7mHEe2+h0ztEoUZ
	ytyRdvAWdaYLSWs7Eonl6I4XmnxEVY4=
From: Sean Anderson <sean.anderson@linux.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	devicetree@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	linux-acpi@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 0/2] device property: Add fwnode_property_get_reference_optional_args
Date: Mon,  7 Apr 2025 18:37:12 -0400
Message-Id: <20250407223714.2287202-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This series adds a fwnode-equivalent to of_parse_phandle_with_optional_args.


Sean Anderson (2):
  device property: Add optional nargs_prop for get_reference_args
  device property: Add fwnode_property_get_reference_optional_args

 drivers/base/property.c  | 50 ++++++++++++++++++++++++++++++++++++++--
 drivers/base/swnode.c    | 13 +++++++----
 drivers/of/property.c    | 10 +++-----
 include/linux/fwnode.h   |  2 +-
 include/linux/property.h |  4 ++++
 5 files changed, 65 insertions(+), 14 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty

