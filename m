Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904721C3F02
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749892860; cv=none; b=iB0J2llG2uHZTfnNZDuinPxwl2F2ORC2Q8kbXkGx+TQlTHZ/hK0OX7DKFnDqIQT9ju9cftzot7T6Y7Z9CMfJTQ66PcZXCGycnOq9chwoEBTz83XwyC0PfPBFUarNOyr09suoyFSptM7QgBQ0PHbiXJIYDhZdhZW/lKcmbzJlTmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749892860; c=relaxed/simple;
	bh=W5hlwtdNYuFLR3ROpslmOpBXiDfXyCVxtnQsk50vkYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JJjX3ordlvpIIDQBNMrVG1bqHL9prY1aivCLPTJlrY7BBSlQEKiASBhLkFOsFoFdOj/qvVHjvtQ+kZdkGFd8IU7ss5v7x7W3O0sXolrrSHMZPUoG8L9UsqmIN2W5+p5BXb7avMD/VWUwrhCRNtDGeJLHE/fRl7UZg/6EoR0Fjio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhMoSTPo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhMoSTPo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77678C4CEEB;
	Sat, 14 Jun 2025 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749892860;
	bh=W5hlwtdNYuFLR3ROpslmOpBXiDfXyCVxtnQsk50vkYk=;
	h=From:To:Cc:Subject:Date:From;
	b=fhMoSTPoO8LCPxTDDkUrto9x/rjjEgd9XegV1kEFceXW1hNKuqw+c4RH7UNf3qIgG
	 KAVycSWqfTsT+iwgrazhVqm9KQXeTfMk2GD3P+ZdzCUQvhKnYymG2291tHh7GflZbn
	 /U9iV5lv71/lKMCtdNlHu4/1zwSHsYgEtGgjIuTqbs+lEowtWdN48Lv7KNoPzVyxwY
	 wMuCab66OtnhxR5UlqWGlcgQBMNy1bc+z0j5cyQoO38sro+Ej/cJA7gr3+lpKGvoNI
	 KjUo/lCpat/9xtGn6fOCDRFkC5xt+c5WWPf9PQkRQSyhX0QToX82uiDWgm9Zqz49ue
	 2zhZBmFdw9gQw==
From: Danilo Krummrich <dakr@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] mailmap: add entry for Danilo Krummrich
Date: Sat, 14 Jun 2025 11:20:23 +0200
Message-ID: <20250614092054.161658-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for my Red Hat address.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index b77cd34cf852..ad9fcf9c9194 100644
--- a/.mailmap
+++ b/.mailmap
@@ -197,6 +197,7 @@ Daniel Borkmann <daniel@iogearbox.net> <daniel.borkmann@tik.ee.ethz.ch>
 Daniel Borkmann <daniel@iogearbox.net> <dborkmann@redhat.com>
 Daniel Borkmann <daniel@iogearbox.net> <dborkman@redhat.com>
 Daniel Borkmann <daniel@iogearbox.net> <dxchgb@gmail.com>
+Danilo Krummrich <dakr@kernel.org> <dakr@redhat.com>
 David Brownell <david-b@pacbell.net>
 David Collins <quic_collinsd@quicinc.com> <collinsd@codeaurora.org>
 David Heidelberg <david@ixit.cz> <d.okias@gmail.com>
-- 
2.49.0

