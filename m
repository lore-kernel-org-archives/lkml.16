Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB0521ABAA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743100573; cv=none; b=ut5veCoCy8ijSDUZkdOoGlPYN09PVj+yFJfn3WYPMglrvxK+qCZJIhO/Kg7Lc8x/T36Usn0FdDv8ldmasz99VgJv3wU01R/wshQeXbiRUK3Gm7mNiQTVe41mE8Mc8xMuOwOvxzfoM7J0798RtQJX/prDWWI/ti/hSFi+78J26nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743100573; c=relaxed/simple;
	bh=CE4/oDjiEWaIshAjAn7MSZbXBgLxVag9Ei1QyScIlqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KCBLdNNjFdVmWO6MwIK8WijdEbgIYcqVDhOQfkXIICJp/sTBQHf7hC59HoD+DGeBTDe6zC0ye26TccVvE8tEQuq6wJHXyER+taMMlZ2byQaQTZGL5X4iDERjjTuArux0mzgsyvvov0UFH8sz2i3BxsAIT9AYQ8rbQ/PmIe0RPd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=paeIaYn7; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="paeIaYn7"
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.10.129])
	by linux.microsoft.com (Postfix) with ESMTPSA id ECBD02102370;
	Thu, 27 Mar 2025 11:36:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ECBD02102370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1743100566;
	bh=IR19B325nsA5nlJ5bhwMThdWR79p1/1wh77Hddiwjps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=paeIaYn7iRbntA1GZvRqfqwv8C+bWiXQ915zungXbIFEaZy5YcrIb5B/15eLI7f9x
	 ih8DrizT0//uKo0xOgzsmB8Fxz/M/05SOelQYcOev2U5r9SyGCDg5R3nJGZs5J9DbS
	 8/viCZDKfzMwk03wtSKnAVYMgtB9Tz4tUAL1Dol4=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: masahiroy@kernel.org,
	kees@kernel.org
Cc: shyamsaini@linux.microsoft.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] init/Kconfig: conditionalize GCC10_NO_ARRAY_BOUNDS
Date: Thu, 27 Mar 2025 11:35:59 -0700
Message-Id: <20250327183559.3339185-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211221030.1815731-1-shyamsaini@linux.microsoft.com>
References: <20250211221030.1815731-1-shyamsaini@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Masahiro, Kees

do you have any reviews for this patch?

Thanks,
Shyam


  git send-email \
    --in-reply-to=20250211221030.1815731-1-shyamsaini@linux.microsoft.com \
    --to=masahiroy@kernel.org \
    --to=kees@kernel.org \
    --cc=shyamsaini@linux.microsoft.com \
    --cc=linux-kernel@vger.kernel.org \
    /tmp/reply-kconfig-init
