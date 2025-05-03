Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D032EAF9
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746259533; cv=none; b=BP46Sxf9D+yzgZZ2GviVGyRE7mwThCDz8qNisnEH89pi7GhJLzHzdC8c/3iIeXFgxWynC6oOn+Do/ZevofmfKltF5952XCHBhu8R/gTE0oiOQmnQs3S4ZqKhQZXcbS0GyTfUkaCEpNEvD2MeAMDesIt//uOwSUtcf7Tw9V8tFiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746259533; c=relaxed/simple;
	bh=bjf5yJdyuYmO2ewbTmco0EEG24WY4zujXbqvKsXCtUI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hTSNfO3c9kmJ6wgkKkhXuaZsYcmr+zCvvQXJhSrRwplfCRDbPy/RO+DXCPF/hp+/M0BvAGYG3c2eYJtgDuIRZL6DQBFMlnF/w+JVDvXQoRXYuVzrifOFHdpLPiWqzzcc9Yo16jJKChvm6Dxm3GlS/lQjSUWMaJCQFMCxiyNkkcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=muXSOKMV; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="muXSOKMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=okT1G
	bV7fpg16Pizw/hGVwDxaBdUKFxs0kpe7FMQo2s=; b=muXSOKMVwKHNyIMADTHKJ
	x1R92ZDGmCGBpP3WCOafufy3+/s+krus7MktB9sh5cDC62/sbR6ehzCtidfNAYZ4
	xwm8+FkTJtFwILZdGNRfBYqNXbj+ElygrrDr+3I4lryadFPMPayTYKQBvh19eevl
	e0AGtitxUVhOyUpxQzauu8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3dSsozhVoZs+1EA--.41171S2;
	Sat, 03 May 2025 16:04:58 +0800 (CST)
From: Changhang Luo <luochanghang_nudt@163.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org,
	Changhang Luo <luochanghang_nudt@163.com>
Subject: [PATCH] driver:fix a bug of function remove_nodes in "drivers/base/devres.c"
Date: Sat,  3 May 2025 16:04:54 +0800
Message-Id: <20250503080454.3667-1-luochanghang_nudt@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3dSsozhVoZs+1EA--.41171S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr48KFy7Ar18GryfWr1Dtrb_yoW8Cry8pa
	95CrW5CwnFqr1UGFs293yqgF4fZw18trZFga43C3yUAr43ur97Kr13ta4rtry5CayUZF4U
	XayYqrnrWwn5ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMNtx-UUUUU=
X-CM-SenderInfo: poxruxxdqjxtxqjb03lgw6il2tof0z/1tbiXRQ+9WgQg7euLwABsO

The resource management mechanism in Linux divides resources 
into different groups for easier management. Each closed group
has a start and an close resource node to represent the scope
of the resource group. The function "remove_nodes" is try to move
the nodes in the same group into the todo list. Fisrt the function
moves the normal nodes into the todo list, then scan the left node
and color the group value of two if the start and close resource
nodes contained in [current node, end).

While, in the second pass section here is:
  if (list_empty(&grp->node[1].entry))
     grp->color++;
which means that the color is set to 2 when the grp_node[1] is not
in the list.This situation is inconsistent with the original design
intention that color value is set to 2 if the start and close nodes
 both contained in [current node, end).

So it should be
  if (!list_empty(&grp->node[1].entry))
    grep->color++;
that the grep->node[1] is verified to be contained 
[current node, end) and then color is increased to 2.

Finally,
  if(grp->color ==2){
    list_move_tail(&grp->node[0].entry,tode);
    list_del_init(&grp->node[1].entry);
  }
the closed group can be removed currectly.

then
  list_del_init(grep->node[1].entry);
while

Signed-off-by: Changhang Luo <luochanghang_nudt@163.com>
---
 drivers/base/devres.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index d8a733ea5..68f64256a 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -477,7 +477,7 @@ static int remove_nodes(struct device *dev,
 		BUG_ON(!grp || list_empty(&grp->node[0].entry));
 
 		grp->color++;
-		if (list_empty(&grp->node[1].entry))
+		if (!list_empty(&grp->node[1].entry))
 			grp->color++;
 
 		BUG_ON(grp->color <= 0 || grp->color > 2);
-- 
2.25.1

