Received: from smtp-fw-9105.amazon.com (smtp-fw-9105.amazon.com [207.171.188.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6619280A45;
	Fri, 11 Apr 2025 21:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744407302; cv=none; b=LmyXy31ZPIJHv7mO2v5U7VpJZy8zZc9240i1fp6oEVaL1nQ5zbnSQYYj2xhk15af+s8KzyoimPo520qiiwGpyJjSl68/bOZKKsSYu43t+Fke7BSSuEmCiO+W090Zo+HoUUVG1LGlmj0zvNLdgzptX7LiazxO/5GU8zEmfxXXt0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744407302; c=relaxed/simple;
	bh=+ma8nG/ZgTMM87HL8aXdkAzrOaiXSwL5ubcpKmDY0qg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T7RFhnBLbCOg1m0pm4IbDwbfri97QB2YBWpgpG4V85WABUKGJkDt0ADUXA64F2UMYnVoL+4sCVS2pLWY2lO0CaYLnp2Ha2+wxtvjahodtzNnkXziu1NjwGu+RteUjqVmfRYUYiN7yvgMb+y/XqB8l1E/7nbKAPKuwiNzIrd3aG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=jLPcu8ri; arc=none smtp.client-ip=207.171.188.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="jLPcu8ri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1744407301; x=1775943301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eT/tJ/wTTsvhW3Sf+DQ/bM6O1oq0kEosdAAWcn7LFJ4=;
  b=jLPcu8ri8mFkdGUKH84pIQfAgux1MWA32ozYHwfAO1UW0sosKYJkWPHO
   odM2Q7ERQC14uh3jgJwZgi9rZR+7lWA4/DwzTBeL27562GQoUDPHY8emu
   sUmAyhOIz7opoyo2D2LibxvlhoWp1zr3A1BekeEOUNzJgZdlZXSOhs9WT
   o=;
X-IronPort-AV: E=Sophos;i="6.15,206,1739836800"; 
   d="scan'208";a="9731603"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9105.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 21:34:55 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.21.151:54632]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.8.63:2525] with esmtp (Farcaster)
 id 6f3ad8c3-ae03-41fd-89be-cde5a5131b4f; Fri, 11 Apr 2025 21:34:54 +0000 (UTC)
X-Farcaster-Flow-ID: 6f3ad8c3-ae03-41fd-89be-cde5a5131b4f
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 11 Apr 2025 21:34:53 +0000
Received: from 6c7e67bfbae3.amazon.com (10.119.240.29) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 11 Apr 2025 21:34:51 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <leitao@debian.org>
CC: <davem@davemloft.net>, <dsahern@kernel.org>, <edumazet@google.com>,
	<horms@kernel.org>, <kuba@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <pabeni@redhat.com>, Kuniyuki Iwashima
	<kuniyu@amazon.com>
Subject: Re: [PATCH net-next 8/9] mpls: Use nlmsg_payload in mpls_valid_getroute_req
Date: Fri, 11 Apr 2025 14:34:41 -0700
Message-ID: <20250411213442.69177-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411-nlmsg-v1-8-ddd4e065cb15@debian.org>
References: <20250411-nlmsg-v1-8-ddd4e065cb15@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D032UWA004.ant.amazon.com (10.13.139.56) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)

From: Breno Leitao <leitao@debian.org>
Date: Fri, 11 Apr 2025 10:00:55 -0700
> Leverage the new nlmsg_payload() helper to avoid checking for message
> size and then reading the nlmsg data.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>
