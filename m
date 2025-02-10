Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4DF1DDC14;
	Mon, 10 Feb 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182705; cv=none; b=ievwm1KLWHpr3ybawQV+2CRAGc7tKTtDooRruq5I/HStchIudm6Cug7jcm7NV8ugnirUQuMEzwmTND1haXQW2enlQyQQHeiKo+OXKYuvr6moltQKhifXw1d1JDDTgmE1bQJJcNmoy/k3WnwkOj6nnJelLETWLIH6YFGa/sliUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182705; c=relaxed/simple;
	bh=C6C05wogDAu+3jTlaZMOMRiURyiScHA+qoQYLRb96Z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iRSA31tSOq7f9S4elMt1jurNp6Ct7R7I/g3gdlLj0jf4UZj9ldwz1YO3OKItgSzLH+Pe3Jw6oU2mRMZVPMGkse0KkRtCUbRZRQNinzjGhFI3hUAQycYeMTu6MTz5j7BKBblmZsPLeYUjQUG5SE2fRwqJSkosKo2xvwGMTVQKth8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyCwp/mE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyCwp/mE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4422EC19421;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=C6C05wogDAu+3jTlaZMOMRiURyiScHA+qoQYLRb96Z8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lyCwp/mEpEKPVc9GuFIMV2RYIEM646Fn1/G/VWVLj3GFrwf7eKYzaUVrBYNJKx/rC
	 DF7N2adXwEWsRsDwJtxiDUtVFpIgul55a18Jc2JocDMiigdR+9Jbd7Fmva0rvaqE2R
	 WTJXbKAooNTgHUXsCU07BQhQ/lsr54iZhLVcv8JjKwZZvmPK7iVmyZzz5ZAOIIbtbs
	 pgd11/jr/vLzMJuy2SBFRFDkZeHm4RzMKhxi9Jbtxw71lgQWhbgFr3JMZyUk0qDrA3
	 ZMsNTYaPgYmsmIr37X4fNRxPtuGQvSgNUpUXbGYlM5jkesJPVj7rIGIHvSm79XVmEi
	 9dv8YxvyjjYEQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006Cjk-2AR6;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 25/27] scripts/lib/abi/abi_parser.py: make it backward-compatible with Python 3.6
Date: Mon, 10 Feb 2025 11:18:14 +0100
Message-ID: <41d2f85df134a46db46fed73a0f9697a3d2ae9ba.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Despite being introduced on Python 3.6, the original implementation
was too limited: it doesn't accept anything but the argument.

Even on python 3.10.12, support was still limited, as more complex
operations cause SyntaxError:

	Exception occurred:
	  File ".../linux/Documentation/sphinx/kernel_abi.py", line 48, in <module>
	    from get_abi import AbiParser
	  File ".../linux/scripts/lib/abi/abi_parser.py", line 525
	    msg += f"{part}\n{"-" * len(part)}\n\n"
                       ^
	SyntaxError: f-string: expecting '}'

Replace f-strings by normal string concatenation when it doesn't
work on Python 3.6.

Reported-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/abi/abi_parser.py | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/abi/abi_parser.py b/scripts/lib/abi/abi_parser.py
index 0c3837e52afa..f08de6d3bf7c 100644
--- a/scripts/lib/abi/abi_parser.py
+++ b/scripts/lib/abi/abi_parser.py
@@ -493,7 +493,7 @@ class AbiParser:
 
                 if cur_part and cur_part != part:
                     part = cur_part
-                    msg += f"{part}\n{"-" * len(part)}\n\n"
+                    msg += part + "\n"+ "-" * len(part) +"\n\n"
 
                 msg += f".. _{key}:\n\n"
 
@@ -517,7 +517,7 @@ class AbiParser:
                     msg += f"Defined on file :ref:`{base} <{ref[1]}>`\n\n"
 
             if wtype == "File":
-                msg += f"{names[0]}\n{"-" * len(names[0])}\n\n"
+                msg += names[0] +"\n" + "-" * len(names[0]) +"\n\n"
 
             desc = v.get("description")
             if not desc and wtype != "File":
@@ -541,7 +541,8 @@ class AbiParser:
 
             users = v.get("users")
             if users and users.strip(" \t\n"):
-                msg += f"Users:\n\t{users.strip("\n").replace('\n', '\n\t')}\n\n"
+                users = users.strip("\n").replace('\n', '\n\t')
+                msg += f"Users:\n\t{users}\n\n"
 
             ln = v.get("line_no", 1)
 
@@ -567,7 +568,9 @@ class AbiParser:
                 elif len(lines) == 1:
                     f.append(f"{fname}:{lines[0]}")
                 else:
-                    f.append(f"{fname} lines {", ".join(str(x) for x in lines)}")
+                    m = fname + "lines "
+                    m += ", ".join(str(x) for x in lines)
+                    f.append(m)
 
             self.log.warning("%s is defined %d times: %s", what, len(f), "; ".join(f))
 
@@ -615,10 +618,11 @@ class AbiParser:
                     if users:
                         print(f"Users:\t\t\t{users}")
 
-                    print(f"Defined on file{'s'[:len(files) ^ 1]}:\t{", ".join(files)}")
+                    print("Defined on file(s):\t" + ", ".join(files))
 
                     if desc:
-                        print(f"\n{desc.strip("\n")}\n")
+                        desc = desc.strip("\n")
+                        print(f"\n{desc}\n")
 
         if not found_keys:
             print(f"Regular expression /{expr}/ not found.")
-- 
2.48.1

