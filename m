Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34D326560E;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106995; cv=none; b=lijcEo03rShhv54xYXWzyaBSA48VgI++YRzeV16o82DUn569Aw4e4Vxq6xPzgbGoRBG55GxATOnXJBnwuoM/Iha7HT++Pq4OquwALyy9dr1FRqg8nAmwTeiXrFtAso7Vbjiap4ym9RdyCxpa5oObvYnKt9+nL4JKeHqGTxhdET0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106995; c=relaxed/simple;
	bh=n+o0b+HPwq6x4iRjMZOAvXZhldtuxW0vCL+uH+CKE7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gx5w/CO7ea+odq/i+pQENfsJFJpKyAZGa9+7MHfHRXfpo9Ippjy3haNjH+833WiixbxlrH2tisw8zQ36W4HQjzV2PabFfInxl7bjMYgb88DeFcCHFppxf4t2XKRhBKmG0+cnErmZ2WNT7QwIyIZqpx7dRfWP+NR1CDIlWg9Da+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+bqv++g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+bqv++g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834E4C4CEE5;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106995;
	bh=n+o0b+HPwq6x4iRjMZOAvXZhldtuxW0vCL+uH+CKE7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M+bqv++gr76ibXFjqXKNdB7KWpQmyV+1/0cxudcwJ5Utv8XlqI1ZUwag/le4rPwc2
	 ZcA+YIsXUM1pHJepUQp9txFu/HyEOpBWx6CJZ3lWBhRk0BAkV4GcAM0EPf/f6UwiB8
	 AhYNs1uSfZJkLJvv7jKVmiz2ivfXVaT1yu2ArTqFcZ7/LxMD57oXTAoqkc8BzlpgGd
	 zqVhqquhq+JdpFMg8YCCZg2gG2UMICFY5YmNSoAfA0y1H8+oLhyJSTx8SAwo+QxPjg
	 opEKYJ4u7m6Sn7IKBpXFja2orHCjB3P7nFINEv49FAtjLx4MZIy/80frAOd7kLhwjw
	 A3hZLOc85zPlg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25ts-00000008RVL-41PS;
	Tue, 08 Apr 2025 18:09:48 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/33] scripts/kernel-doc: add a symlink to the Perl version of kernel-doc
Date: Tue,  8 Apr 2025 18:09:05 +0800
Message-ID: <a5d69e436287433ad8be066c648a77ffe493c21c.1744106241.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744106241.git.mchehab+huawei@kernel.org>
References: <cover.1744106241.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Preserve kernel-doc name, associating with the curent version
in Perl.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 scripts/kernel-doc

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
new file mode 120000
index 000000000000..f175155c1e66
--- /dev/null
+++ b/scripts/kernel-doc
@@ -0,0 +1 @@
+kernel-doc.pl
\ No newline at end of file
-- 
2.49.0

