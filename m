Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C721248F55
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317298; cv=none; b=D2dJwzA7VyIhmxblFXCme1K5NymonybU38k9bSuP2KuZDr4mwY36wdlWfpKvSOmcAECUrFAgzi48DMEqvWEPSoVDtT8Lq2GO306w+QbZd3RC5Yw+gRIJwc+Da10N71F6u04W84vc52yGfTr+3IGjlhZKqbmHpKglUoZ0ThFivYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317298; c=relaxed/simple;
	bh=eEFc4F7xE1kxOscj3Caa6fs+2Wwo8rF7+/oxQOwlfMQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NngHNJu8Ghww6p9KHGjpNWXch63pq1pYy9n/WdWA340qQyjjCNzZ10Yy5Qrjh+HwlAc+q8fNORNFbujfathd7AvASI+xAdMNylK15w1aT3m34R/bqUO+EpXn2IFUuxhD9XHDdttXFa7/3SMfErXncmC2sgnl7n19/bE9/1PUd6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from Jtjnmail201618.home.langchao.com
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id 202506191513513446;
        Thu, 19 Jun 2025 15:13:51 +0800
Received: from localhost.localdomain.com (10.94.7.47) by
 Jtjnmail201618.home.langchao.com (10.100.2.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 19 Jun 2025 15:13:50 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel
	<przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: <linux-kernel@vger.kernel.org>, chuguangqing <chuguangqing@inspur.com>
Subject: [PATCH 0/1] check the ioremap return value first (supplementary CC)
Date: Thu, 19 Jun 2025 15:11:20 +0800
Message-ID: <20250619071253.3498-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250618092544.53696-1-chuguangqing@inspur.com>
References: <20250618092544.53696-1-chuguangqing@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Jtjnmail201617.home.langchao.com (10.100.2.17) To
 Jtjnmail201618.home.langchao.com (10.100.2.18)
tUid: 20256191513514699e9fac132e6ca4917fb5f5223e432
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

Always check ioremap() return value  before use.

chuguangqing (1):
  ixgbe: check the ioremap return value first

 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.5

