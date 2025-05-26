Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1CA1876
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748241348; cv=none; b=A4r7CmgMYynaztsx5BVEAYDH17R+uEQy9EHe9JV5v1GLpI4y5VZBRiyfh+85exyWbKKaRAYN5P+l48hMXwV1ZokwnlzzQacuzsp0b3XSDlkXJtWt4sNXM/9FTsPcSmNfhVZX5hXWzuH1a0Aps2d8HIEi6SA3tzkmRaZrzo82p/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748241348; c=relaxed/simple;
	bh=xx8UQce5G1X0v9V8KkMFPofzo8dSpORDUL1PqfJD/AA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PQWQ4TacJOLlxDTxRyZLubtf9mBbyfvg/LKmUlq7EJioKWOZcamUspIF7vMH7VTpkDfq7IyI+sUNoZX7DZkioz9+IviDF91WbKU2ll0PoiKvIyVBp7Y8wPJl9gP/NlvPTj/zRVQvuqGLBYJHIyjomIxErNO/9LCdseGovU1/LF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5004B153B;
	Sun, 25 May 2025 23:35:23 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DECC53F5A1;
	Sun, 25 May 2025 23:35:35 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: david@redhat.com,
	ziy@nvidia.com,
	willy@infradead.org,
	dhowells@redhat.com,
	hughd@google.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com,
	aneesh.kumar@kernel.org
Subject: [QUESTION] xas_reload() in iter_xarray_populate_pages()
Date: Mon, 26 May 2025 12:05:24 +0530
Message-Id: <20250526063524.22597-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all,

After doing an xas_load() and xas_retry(), we take neither a reference nor a lock
on the folio, and we do an xas_reload(). Is this just to reduce the time window
for a race?

If the above is true, then, there is a negligible window between xas_load() and
xas_reload(), because only xas_retry() exists between them, so why to even reload()?

Thanks,
Dev

