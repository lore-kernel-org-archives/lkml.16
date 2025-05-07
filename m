Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6F325E82F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620583; cv=none; b=fcN27x/Fs/J+evDS+ASodoMRl6Mci3bhw/V1pY7Yt8vZetuA0HbIJebBvi59u2HIg5GWhubejQ89ht9NnOkWlPzh+VvTRZBFIAelCCr8tFv4c9cCojiJMXZrJC6aux8rWaV+bYyztZHSZqxeFVNcEAG/n9e6GrHsbPHeoC9alnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620583; c=relaxed/simple;
	bh=PTePx/tbSwUMSUcdhzkd1zsfWx4z1VfNP7TIanK5+SM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=agsHcd87QKSL58J/AqiPsGwzuwnfvv9M9L5ZjFijadulzchFkUupbapQIOGYjPKWAAROLMMpkO7K43nBi5ohulwniEUvvCFCsusNC0NxYGxPlThNoo4cSoKzVJRiv6lgO+KKJqV1yHZ0CxWzjhr1ljmWcj7A1mzAJOsVG2d9+eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyMgeiwy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyMgeiwy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D1DC4CEE7;
	Wed,  7 May 2025 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746620582;
	bh=PTePx/tbSwUMSUcdhzkd1zsfWx4z1VfNP7TIanK5+SM=;
	h=From:Subject:Date:To:Cc:From;
	b=DyMgeiwy9dQcX98K3g4aW/54zNKWxLQ3A7zEN+XEzypf3o7lW/hIwrCVbLEPOfnVD
	 U0kdBIHafEAdujP8NfOeuZvhufFhu7qJfjVxuVUMmQXr57TIhRncUgJqKROYYZ6elp
	 6/uZNsFz1UMgQ3TZnX9zI3HkazMJley3KhbN4MClp/nCrmx0RfAnnLvJ+uU5YGEezg
	 X0L3NnbifJYFDHXB6iRjlNZiV8cWeyI7F8mUj8O6vKI1iHnu6WdoZZIcElcGZwKP64
	 xlz3chaV7xipc1qtMqBle45KOEzWEXqVSZyiE7gfG8hDzjHnHYclzJn6ozEVpXfHHx
	 USpmsuLplwJvg==
From: Daniel Wagner <wagi@kernel.org>
Subject: [PATCH v6 00/14] nvmet-fcloop: track resources via reference
 counting
Date: Wed, 07 May 2025 14:22:56 +0200
Message-Id: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKBQG2gC/2XRzW4CIRSG4VsxrEsDh1+78j5MFwMclGgHy0xJG
 zP3XvxJ1JnlR/K8i8OZDFgSDuRjdSYFaxpS7tvQbyvi912/Q5pC2wQYKAZc0r5+4UijP+Z8op2
 WayOsM6iRNHIqGNPvNbf9bHufhjGXv2u98svrPQT6NVQ5ZdQzF6wIUqDuNgcsPR7fc9mRS6nCQ
 wvOZxqajl4y77TEgEstnrWdadE0UxE9i55B1AstH1pyNtOyaYPKS3DGgXcLrZ40iJlWTYtg4lp
 bA7ZTL3q6nbTg90/7mPF+12n6BwYcNiG2AQAA
X-Change-ID: 20250214-nvmet-fcloop-a649738b7e6e
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

Rebased on nvme/nvme-6.16 and addressed Hannes feedback.

The blktests nvme/030 is likely to fail if in the background udev is
triggering a 'nvme discover'. In the meantime I collected some more
patches but hold them back until this here is done.

Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
Changes in v6:
- rebased on nvme/nvme-6.16
- made the slab cache static, reported by kernel test robot <lkp@intel.com>
- fixed inverted logic when testing if the port should be deleted
- Link to v5: https://patch.msgid.link/20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org

Changes in v5:
- rebased to nvme/nvme-6.15
- Link to v4: https://patch.msgid.link/20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org

Changes in v4:
- reordered patches so that they pass the tests each on of its own
- addressed feedback from Christop, Hannes and James.
- hold lock while looking up nport and insert nport operation in fcloop_nport_alloc
- dropped patches from 20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org
- Link to v3: https://lore.kernel.org/r/20250318-nvmet-fcloop-v3-0-05fec0fc02f6@kernel.org

Changes in v3:
- fixed memory leaks
- allocates fcloop_lsreq in fcloop directly
- prevent double free due to unregister race
- collected tags
- Link to v2: https://lore.kernel.org/r/20250311-nvmet-fcloop-v2-0-fc40cb64edea@kernel.org

Changes in v2:
- drop tport and rport ref counting, use implicit synchronisation
- a bunch of additional fixes in existing ref countig
- replaced kref with refcount
- Link to v1: https://lore.kernel.org/r/20250226-nvmet-fcloop-v1-0-c0bd83d43e6a@kernel.org

---
Daniel Wagner (14):
      nvmet-fcloop: track ref counts for nports
      nvmet-fcloop: remove nport from list on last user
      nvmet-fcloop: refactor fcloop_nport_alloc and track lport
      nvmet-fcloop: refactor fcloop_delete_local_port
      nvmet-fcloop: update refs on tfcp_req
      nvmet-fcloop: add missing fcloop_callback_host_done
      nvmet-fcloop: access fcpreq only when holding reqlock
      nvmet-fcloop: prevent double port deletion
      nvmet-fcloop: allocate/free fcloop_lsreq directly
      nvmet-fcloop: don't wait for lport cleanup
      nvmet-fcloop: drop response if targetport is gone
      nvmet-fc: free pending reqs on tgtport unregister
      nvmet-fc: take tgtport refs for portentry
      nvme-fc: do not reference lsrsp after failure

 drivers/nvme/host/fc.c       |  13 +-
 drivers/nvme/target/fc.c     |  85 +++++++--
 drivers/nvme/target/fcloop.c | 437 +++++++++++++++++++++++++++----------------
 3 files changed, 362 insertions(+), 173 deletions(-)
---
base-commit: 0ea9b1f7aabb8af08649048d04fa3cee44dac4ab
change-id: 20250214-nvmet-fcloop-a649738b7e6e

Best regards,
-- 
Daniel Wagner <wagi@kernel.org>

