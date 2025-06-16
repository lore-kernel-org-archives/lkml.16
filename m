Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500091DFD8B;
	Mon, 16 Jun 2025 07:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057576; cv=none; b=mV7/809nPMUjnceA45IEPcw2fYXJ2jXqYgGAHo6nxVPdAcaK5jK6NAhHM+bmLoWMrvy7NYhyDWmdMXKSTVNy5N+8+2nN2xv1TqY6hbhADDrDSKMQ0x+JFhDvVF+0o8X8maX2Eju+JCc4EBmj1uMbKBUQsRzOqPFvK6JNw63sq28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057576; c=relaxed/simple;
	bh=/rEhQW9KYXxzmLJD+tA2atWMb5pecj1yFpRa0Ag1wi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rwhki+skPjn649auumWOUJhd22WqMCIKw8CUA0flsmlX7laIGu3dlW4GIIXc4fx70ujCtIVbRVtN5r4w+2TmY2xSFRMQuK3KYtdZ9Vi32Ikww/eVIsSyqSoxBF9gycS9EsI+O/vsN3KGI1WxLmUNuTsbQEnKwUHkoIFMat7ihaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZtOO+vnD; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZtOO+vnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=QT
	5fsjS9Lz3AShnH5A3u+1b3BD2GU11+T0Ix+o9fY7M=; b=ZtOO+vnDTtbQ65Dw+j
	vZdyXew1FwnVduvbk/67OybXxFzhccJEg5pW98ryT7UwvLQB1OuidCVLChB3qHj3
	v1VheAQBDjX/LLb5SeId3GaC/oEyKLWuEZUVQ7yZXSVbgW4mDYIhnfO2WnJ2XLsK
	yOsbn2Jn8E/QO90ZYEzBy3JHA=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCXq3hDwk9oF3UMIg--.6743S2;
	Mon, 16 Jun 2025 15:05:43 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: neil.armstrong@linaro.org
Cc: conor+dt@kernel.org,
	quic_jesszhan@quicinc.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	tzimmermann@suse.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 1/2] dt-bindings: display: panel: Make reset-gpio as optional for Raydium RM67200
Date: Mon, 16 Jun 2025 15:05:16 +0800
Message-ID: <20250616070536.670519-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXq3hDwk9oF3UMIg--.6743S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1xuFWkGrWfuw4DGr1UAwb_yoWDZrg_JF
	Wxu3ZIyws5AF9a9F4qyw4fWr13JwsxCrWkA3Z7XF9rKry8KryUKF97J34Yyr1DCF47ury5
	uF93Wryavws2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0bVy7UUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAJuXmhPvU+hAAADst

From: Andy Yan <andy.yan@rock-chips.com>

Although the datasheet of the panel module describes that it has a
reset pin, in the actual hardware design, we often use an RC circuit
to control the reset, and rarely use GPIO to control the reset. This
is the way it is done on our numerous development boards (such as RK3568,
RK3576 EVB).
So make the reset-gpio optional.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 .../devicetree/bindings/display/panel/raydium,rm67200.yaml       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
index 54c9c0ef45ecc..97b7fbe05c077 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
@@ -42,7 +42,6 @@ required:
   - compatible
   - port
   - reg
-  - reset-gpios
 
 additionalProperties: false
 
-- 
2.43.0

